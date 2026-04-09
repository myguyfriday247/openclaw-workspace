# CommTracker App Review

**Date:** March 31, 2026  
**Reviewer:** OpenClaw (cron job)  
**App Location:** ./Projects/CommTracker/

---

## Build Status

✅ **Build Successful** - No errors or warnings

```
Route (app)                              Size     First Load JS
├ ƒ /                                    137 B          87.5 kB
├ ○ /dashboard                           5.31 kB         160 kB
├ ○ /dashboard/admin                     2.74 kB         143 kB
├ ○ /dashboard/calendar                5.45 kB         186 kB
├ ○ /dashboard/events                   2.93 kB         215 kB
├ ƒ /dashboard/events/[id]              7.08 kB         161 kB
├ ƒ /dashboard/events/[id]/edit        6.3 kB          212 kB
├ ○ /dashboard/events/new              6.71 kB         212 kB
├ ○ /dashboard/graphic-sizes           3.02 kB         167 kB
├ ○ /dashboard/ministries               3.47 kB         167 kB
├ ○ /dashboard/pathways                4.71 kB         186 kB
├ ○ /dashboard/reports                  430 kB          584 kB
├ ○ /dashboard/settings                 2.93 kB         151 kB
├ ○ /login                             1.38 kB         150 kB
├ ○ /pending                           1.14 kB         141 kB
└ ○ /register                          1.53 kB         150 kB
```

---

## Code Review Summary

### Architecture

- **Framework:** Next.js 14.2.35 (App Router)
- **Database:** Supabase (PostgreSQL)
- **Styling:** Tailwind CSS
- **Auth:** Supabase Auth
- **Roles:** site_admin, comm_admin, designer, ministry_team_member, ministry_lead

### Pages Verified (17 routes)

| Route | Type | Description |
|-------|------|-------------|
| `/` | Dynamic | Home - auth check → dashboard |
| `/login` | Static | Login page |
| `/register` | Static | Registration |
| `/pending` | Static | Pending approval |
| `/dashboard` | Static | Main dashboard with role widgets |
| `/dashboard/admin` | Static | Admin management |
| `/dashboard/calendar` | Static | Calendar view |
| `/dashboard/events` | Static | Events list with CRUD |
| `/dashboard/events/new` | Static | Create event |
| `/dashboard/events/[id]` | Dynamic | Event detail |
| `/dashboard/events/[id]/edit` | Dynamic | Edit event |
| `/dashboard/ministries` | Static | Ministry management |
| `/dashboard/pathways` | Static | Pathway management |
| `/dashboard/graphic-sizes` | Static | Graphic sizes config |
| `/dashboard/settings` | Static | User settings |
| `/dashboard/reports` | Static | Reports + PDF export |
| `/dev/components` | Static | Component dev page |

---

## Issues Found

### 1. Potential SSR Issue (Medium Severity)
**File:** `app/dashboard/reports/page.tsx`  
**Issue:** Imports `@react-pdf/renderer` on client side, which can cause issues with SSR if not lazy-loaded properly. The current implementation should work but could be fragile.

### 2. No Error Boundary (Low Severity)
**Issue:** No global error boundary for catching React errors. A root `error.tsx` file should be added.

### 3. Search Results Navigation Bug (Low Severity)
**File:** `app/dashboard/page.tsx` (handleSearch function)  
**Issue:** Channel request search results may navigate to wrong route - it uses `result.id` but should use `result.event?.id`.

```typescript
// Current (potentially wrong):
onClick={() => router.push(`/dashboard/events/${result.event?.id || result.id}`)}

// Should be more explicit about the route type
```

### 4. Missing Loading States (Low Severity)
**Issue:** Some API routes lack explicit loading states before data loads (though most pages have LoadingState component).

### 5. No Form Validation Library (Enhancement)
**Issue:** Forms use manual validation. Consider using zod or react-hook-form forcomplex forms.

---

## Suggestions for Improvement

### Usability

1. **Add Breadcrumb Navigation**
   - Help users understand their location in the app hierarchy
   - Especially important for nested pages like `/dashboard/events/[id]/edit`

2. **Add Keyboard Shortcuts**
   - `n` → new event
   - `f` → focus search
   - `Esc` → close modals

3. **Improve Empty States**
   - Add helpful CTAs (Call to Action) to empty states
   - "No events yet. Create your first event →"

4. **Add Undo for Deletions**
   - Use toast with "Undo" button for destructive actions

5. **Mobile Responsiveness**
   - Test and optimize for mobile devices
   - Add mobile nav drawer

### Efficiency

1. **Add Data Caching**
   - Implement React Query or SWR for data fetching
   - Reduce database queries

2. **Optimize Dashboard Queries**
   - Combine multiple small queries into single batch queries
   - Current admin query does 5+ separate calls

3. **Add Pagination**
   - Events and channel requests should use cursor-based pagination
   - Add "Load more" button for large datasets

4. **Optimize PDF Generation**
   - PDF generation can be slow - consider generating in background via API

### New Features

1. **Drag-and-Drop Reordering**
   - Reorder channel requests via drag-and-drop on calendar

2. **Recurring Events**
   - Support for weekly/monthly recurring events

3. **Bulk Actions**
   - Select multiple items and bulk approve/reject/delete

4. **Calendar ICS Export**
   - Export events to Google Calendar/Outlook

5. **Slack/Discord Integration**
   - Post notifications to church communication channels

6. **Event Templates**
   - Save and reuse event structures

7. **Audit Log**
   - Track all changes for accountability

8. **Quick Stats Dashboard**
   - Visual graphs and charts

9. **Dark Mode**
   - Add theme toggle

10. **Multi-Language Support**
    - i18n for international churches

---

## Database Schema Notes

The Supabase schema includes:
- `events` - Church events
- `ministries` - Ministry departments
- `pathways` - Communication pathways
- `channel_requests` - Content requests
- `channel_request_dates` - Scheduled executions
- `graphic_sizes` - Size presets
- `graphic_deliverables` - Final assets
- `profiles` - User profiles with roles
- `notifications` - User notifications

Schema looks well-designed with proper foreign keys and RLS policies.

---

## Security Notes

- RLS policies present (`supabase/rls-policies.sql`)
- Auth middleware in place
- Role-based access control implemented

---

## Conclusion

✅ **CommTracker is a well-built production app** with solid Next.js 14 patterns, proper Supabase integration, and good role-based access control. The build passes cleanly and the architecture is sound.

**Recommended Priority Actions:**
1. Add error.tsx boundary
2. Fix search navigation bug
3. Add pagination for large lists
4. Consider data caching layer

---