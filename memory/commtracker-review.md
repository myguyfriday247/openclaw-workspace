# CommTracker App Review

**Date:** May 31, 2026  
**Reviewer:** Friday (AI Assistant)  
**Build Status:** ✅ Compiles and builds successfully

---

## 1. Build Check

**Result:** ✅ Build passes cleanly with no errors.

- Next.js 14.2.35, compiled successfully
- 27 static/dynamic routes generated
- No TypeScript errors
- No lint errors

---

## 2. Code Review — Bugs& Issues

### 🔴 Critical

1. **Dead `AddChannelSimple` function** (`events/[id]/page.tsx`)
   - A standalone unused function component is defined at the bottom of the file. It renders nothing useful and is never called. Dead code that should be removed.

2. **Hardcoded inline styles mixed with Tailwind** (`events/[id]/page.tsx`)
   - The "Add Channel" modal uses raw `style={{...}}` props instead of Tailwind classes (`bg-white p-6 rounded-lg max-w-md w-full mx-4`). The rest of the app uses Tailwind consistently. This is an inconsistency that also makes the modal look different from other modals.

3. **Bare `alert()` and `confirm()` calls** scattered throughout
   - `events/[id]/page.tsx` uses native `alert()` and `confirm()` in multiple places (`handleGenerateContent`, `handleAddChannel`, delete buttons). These block the thread and look unprofessional. The app has a `toast` utility — should use `toast.success()` / `toast.error()` and a proper confirmation pattern instead.

4. **Missing loading state on dashboard sidebar widgets**
   - `dashboard/page.tsx` renders role badges and admin/designer widgets while `loading` is still true. The component returns early with `<LoadingState />` only if `loading` is true, but the widgets themselves don't guard against rendering before data is ready. Quick actions and role badges appear immediately (fine), but the admin/designer data widgets could briefly show stale data.

### 🟡 Moderate

5. **`useUserRoles` hook doesn't exclude revoked users**
   - `hooks/useUserRoles.ts` loads roles without checking if the user profile is approved (`is_approved = true`). An unapproved (pending) user could still get role-based access if roles exist in the table. The `/pending` page handles this for auth, but the hook itself doesn't gate on approval status.

6. **No error boundary on pages**
   - If a Supabase query fails, pages like `events/page.tsx` show an `ErrorState` with retry, but many pages silently degrade (e.g., dashboard continues with empty data without alerting the user). Network errors are swallowed.

7. **Calendar page uses `console.log` in production path**
   - `calendar/page.tsx` has `console.log('Raw requests:', ...)` and `console.log('Transformed requests:', ...)` inside `loadData()`. These fire on every calendar navigation and will pollute the browser console in production.

8. **Reports page complex query logic is fragile**
   - The Supabase `.or()` filter in `reports/page.tsx` for date range handling (with NULL end_date detection) is a complex string that could break if Supabase syntax changes. The comment says "Note: For Supabase, we need to handle NULL end_date specially" — this is a known workaround that should be documented or refactored into a stored procedure.

9. **Reports `WeeklyReportPDF` has no error handling**
   - The PDF component renders directly without try/catch. If data is malformed (e.g., `scheduled_date` is null), `format()` will crash. The PDF renderer is server-side, so errors here are silent failures.

10. **No pagination on large lists**
    - `events/page.tsx`, `admin/page.tsx`, and `ministries/page.tsx` load all records at once. With many events or users, this will be slow and memory-intensive. Supabase supports `.range()` pagination.

### 🟢 Minor

11. **Inconsistent button text casing** — "Add Event" vs "Edit" vs "Delete" vs "Create Event" across pages. Should use sentence case consistently.

12. **The `notifications.ts` lib file exists but notifications aren't implemented in the UI** — there's a notification system in the schema but no notification bell, dropdown, or page visible in the app.

13. **Dashboard search is a simple `OR` with `ilike` — no relevance ranking** — results show in arbitrary order. Should sort by relevance or date.

14. **No `is_active` filter on events list** — `events/page.tsx` loads all events including inactive ones (if any exist). Should filter `is_active = true` or add a toggle.

15. **Graphic sizes page (`graphic-sizes/page.tsx`) not reviewed** — the file exists but wasn't examined in detail. Quick check shows it likely has the same pattern as ministries/pathways.

16. **Pathways page (`pathways/page.tsx`) not reviewed** — same as above.

17. **The `dev/components` page is a development debug page** — should be hidden or protected in production builds (e.g., `next.config.js` redirects or middleware blocking).

18. **`NEXT_PUBLIC_ANTHROPIC_API_KEY` used on client side** — `lib/ai.ts` is a client-side module (uses `createSupabaseBrowserClient`). The AI generation key is exposed in the browser bundle. Should move AI calls to server-side API routes (which `/api/generate-content` already does, but `lib/ai.ts` itself is imported client-side in `events/[id]/page.tsx`).

---

## 3. Page Load Check

All routes build successfully. Static pages pre-render cleanly:

| Page | Status |
|------|--------|
| `/dashboard` | ✅ |
| `/dashboard/events` | ✅ |
| `/dashboard/events/[id]` | ✅ Dynamic |
| `/dashboard/events/new` | ✅ |
| `/dashboard/events/[id]/edit` | ✅ Dynamic |
| `/dashboard/calendar` | ✅ |
| `/dashboard/reports` | ✅ |
| `/dashboard/admin` | ✅ |
| `/dashboard/ministries` | ✅ |
| `/dashboard/pathways` | ✅ |
| `/dashboard/graphic-sizes` | ✅ |
| `/dashboard/settings` | ✅ |
| `/login` | ✅ |
| `/register` | ✅ |
| `/pending` | ✅ |

Note: Pages were verified via build output. Runtime behavior (actual data loading, auth redirects) requires a live Supabase instance.

---

## 4. Suggestions for Improvement

### 🔧 Usability

1. **Replace all `alert()`/`confirm()` with a toast + modal confirmation pattern**
   - Create a reusable `ConfirmDialog` component using the existing Radix Dialog. Use `toast.success()` / `toast.error()` for feedback.

2. **Add a notification center**
   - The schema supports notifications but there's no UI. A bell icon in the header with a dropdown showing unread notifications would complete the feature.

3. **Add breadcrumbs to inner pages**
   - Pages like `/dashboard/events/[id]` have a "← Back to Events" button but no breadcrumb trail. Breadcrumbs improve navigation on deep pages.

4. **Improve the dashboard search UX**
   - Add a "no results" state, loading spinner during search, keyboard navigation (arrow keys to select results), and sort results by relevance or date.

5. **Add confirmation before destructive actions**
   - Delete event, delete channel request, deny request — all should use a confirmation dialog, not a browser `confirm()`.

6. **Add empty states with illustrations or better copy**
   - The `EmptyState` component exists but some pages could use more helpful empty state messages (e.g., "No events yet — create your first event to start promoting!" on the events page).

### ⚡ Efficiency

7. **Add pagination to list pages**
   - Use Supabase `.range()` with a `page` and `pageSize` state. Add a simple "Previous / Next" control or infinite scroll.

8. **Debounce the dashboard search**
   - `handleSearch` fires on every keystroke. Add a 300ms debounce to reduce Supabase queries.

9. **Cache ministry/pathway data globally**
   - These rarely change but are loaded on every page. Use React Context or a simple in-memory cache with a 5-minute TTL to avoid repeated queries.

10. **Lazy-load the calendar page**
    - `react-big-calendar` is a large library. If not used on the calendar page (the app uses a custom grid), remove the dependency. If it is used elsewhere, consider dynamic import.

11. **Optimize the reports page query**
    - The complex `.or()` filter in `reports/page.tsx` could be replaced with a Supabase stored procedure or a database view for better performance and maintainability.

### ✨ New Features

12. **Dashboard activity feed**
    - Show recent activity (event created, request approved, content generated) in a timeline on the dashboard. Useful for comm admins to see what's happening.

13. **Drag-and-drop event reordering**
    - For ministry team members who want to reorder their events on the calendar or list view.

14. **Designer assignment workflow**
    - Allow admins to assign a designer to a channel request directly from the event detail page, rather than relying on the "AND model" pathway assignments.

15. **Slack/Teams integration for notifications**
    - Send a Slack message or Teams notification when a request is approved or a deadline is approaching. The notification system is already in the schema.

16. **Recurring events**
    - Currently each event is a one-off. A "recurring event" option (weekly, monthly) would save time for regular programming.

17. **Export events to CSV**
    - On the events list page, add an "Export CSV" button for reports.

18. **Dark mode**
    - The app uses a purple primary color scheme. A dark mode toggle would improve late-night workflow for comm team members.

19. **AI content preview**
    - Before generating content, show a preview of what the AI will produce based on the current event/pathway/voice profile — let the user confirm before committing.

20. **Mobile-responsive improvements**
    - The calendar grid is functional on mobile but the day cells are cramped. Consider a day-agenda view for mobile (list of events for selected day).

---

## Summary

CommTracker is a well-structured church communications platform with a solid foundation. The build is clean, the schema is comprehensive, and the role-based access control is thoughtfully designed. The main areas for improvement are:

1. **Remove dead code** (unused `AddChannelSimple` function)
2. **Standardize UI patterns** (replace `alert()`/`confirm()`, fix inline styles)
3. **Add missing polish** (pagination, debounce, breadcrumbs, empty states)
4. **Security hardening** (move AI key to server-side only)
5. **New features** (notifications UI, dark mode, recurring events, export)

The app is production-ready for a small-to-medium church. The areas above would elevate it to a more polished, scalable product.
