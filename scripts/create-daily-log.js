#!/usr/bin/env node

/**
 * Creates a daily log entry for today
 * Run as cron job or call manually
 */

const fs = require('fs');
const path = require('path');

const memoryDir = path.join(process.cwd(), 'memory');
const workspaceDir = '/Users/myguyfriday/.openclaw/workspace';
const today = new Date();
const dateStr = today.toISOString().split('T')[0]; // YYYY-MM-DD
const filename = `${dateStr}.md`;
const filepath = path.join(memoryDir, filename);

// Check if already exists and has content
if (fs.existsSync(filepath)) {
  const existing = fs.readFileSync(filepath, 'utf8');
  // If file is just the template (less than 200 bytes), update it
  if (existing.length < 200) {
    console.log(`Log exists but empty: ${filename}, will update`);
  } else {
    console.log(`Log already has content: ${filename}`);
    process.exit(0);
  }
}

// Try to read session transcript
const sessionsDir = '/Users/myguyfriday/.openclaw/agents/main/sessions';
let transcriptContent = '';

try {
  if (fs.existsSync(sessionsDir)) {
    const files = fs.readdirSync(sessionsDir);
    const todaySessions = files.filter(f => {
      const stats = fs.statSync(path.join(sessionsDir, f));
      const modDate = stats.mtime.toISOString().split('T')[0];
      return modDate === dateStr && f.endsWith('.jsonl');
    });

    if (todaySessions.length > 0) {
      todaySessions.sort();
      const latestSession = todaySessions[todaySessions.length - 1];
      const content = fs.readFileSync(path.join(sessionsDir, latestSession), 'utf8');
      
      // Extract user messages and assistant summaries
      const lines = content.split('\n').filter(Boolean);
      const userMessages = [];
      const assistantSummaries = [];
      
      lines.forEach(line => {
        try {
          const msg = JSON.parse(line);
          if (msg.message?.content?.[0]?.text) {
            const text = msg.message.content[0].text;
            if (msg.message.role === 'user') {
              userMessages.push(text.substring(0, 200));
            } else if (msg.message.role === 'assistant') {
              assistantSummaries.push(text.substring(0, 300));
            }
          }
        } catch {}
      });

      // Build transcript summary
      if (userMessages.length > 0) {
        transcriptContent = '## Session Summary\n\n';
        transcriptContent += userMessages.slice(-3).map((m, i) => 
          `**User:** ${m}${i < userMessages.length - 1 ? '\n' : ''}`
        ).join('\n\n');
      }
    }
  }
} catch (e) {
  console.log('Note: Could not read session transcripts');
}

// Read recent memory files for context
let recentContext = '';
try {
  const memoryFiles = fs.readdirSync(memoryDir)
    .filter(f => f.endsWith('.md') && f !== filename)
    .sort()
    .slice(-3); // Last 3 files
  
  recentContext = memoryFiles.map(f => {
    const content = fs.readFileSync(path.join(memoryDir, f), 'utf8');
    const firstLine = content.split('\n')[0];
    return `- ${f.replace('.md', '')}: ${firstLine.replace('# ', '')}`;
  }).join('\n');
} catch (e) {}

// Create template
const template = `# ${today.toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric', year: 'numeric' })}

${transcriptContent ? transcriptContent + '\n' : ''}${recentContext ? `## Recent Context\n\n${recentContext}\n` : ''}## Work Log

- 

## Notes

- 

---
*Auto-created ${new Date().toISOString()}*
`;

fs.writeFileSync(filepath, template);
console.log(`✅ Created: ${filename} (${filepath})`);
