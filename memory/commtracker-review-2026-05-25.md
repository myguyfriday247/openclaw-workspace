# CommTracker Weekly Review

**Date:** May 25, 2026  
**Reviewer:** Friday (Sermon System Manager)  
**Build Status:** ✅ Build successful (no errors)

---

## 1. Build Check

The app builds cleanly with Next.js 14.2.35:

```
✓ Compiled successfully
✓ Generating static pages (27/27)
```

All 27 routes compiled without errors. First Load JS sizes are reasonable (137B - 583KB).

---

## 2. Code Review - Bugs & Issues

### 🔴 Critical Issues

1. **Dashboard - Role-based data loading race condition** (`app/dashboard/page.tsx`)
   - `isAdmin` and `isDesigner` are set AFTER initial data load
   - The conditional blocks that load admin/designer data execute before roles are set
   - Result: Admins and designers never see their dashboard widgets

2. **Settings page - No role restriction** (`app/dashboard/settings/page.tsx`)
   - Any authenticated user can access and modify organization settings
   - Should restrict to admin roles only

3. **Admin page - No role restriction** (`app/dashboard/admin/page.tsx`)
   - Any authenticated user can access user management
   - Should restrict to site_admin or comm_admin roles only

### 🟠 Medium Issues

4. **Event detail inline modal** (`app/dashboard/events/[id]/page.tsx`)
   - Uses raw HTML/CSS inline modal for "Add Channel" instead of the Modal component
   - `AddChannelSimple` component is defined but never used
   - Inconsistent UI compared to rest of app

5. **Calendar page - weak query on date filtering** (`app/dashboard/calendar/page.tsx`)
   - Queries by `production_due_date` range but many records may have NULL for this field
   - Fallback to `event_date` not reflected in the query filters
   - Results may appear incomplete

6. **Reports page - PDF rendering compatibility** (`app/dashboard/reports/page.tsx`)
   - Uses `@react-pdf/renderer` v3.3.0 which has known issues with React 18
   - PDF downloads may fail silently in some browsers

7. **Search bar uses raw HTML input** (`app/dashboard/page.tsx`)
   - `<input type="text">` instead of the app's form components
   - Inconsistent styling with rest of app

8. **No delete confirmation for events** (`app/dashboard/events/page.tsx`)
   - `handleDelete` uses `window.confirm()` instead of `ConfirmDialog` component
   - Inconsistent UX

9. **Admin user management - no visual indicator for pending users** (`app/dashboard/admin/page.tsx`)
   - Pending users shown but no way to sort/filter by approval status

### 🟡 Minor Issues

10. **Edit event page - channel request date handling** (`app/dashboard/events/[id]/edit/page.tsx`)
    - `channel_request_dates` IDs are empty strings when updated (`id: ''`)
    - Could cause issues with existing dates being treated as new

11. **Generate content doesn't validate pathway config** (`app/dashboard/events/[id]/page.tsx`)
    - If `pathway.needs_content === false`, still calls API if `pathway.content_structure` is empty and `voiceProfile` exists
    - Should short-circuit earlier

12. **Dashboard - global search timeout** (`app/dashboard/page.tsx`)
    - Search queries run on every keystroke with no debounce
    - Could cause excessive API calls and race conditions

13. **Calendar - execution dates filter by `is_active`** (`app/dashboard/calendar/page.tsx`)
    - The `channel_request_dates` query filters by `is_active: true` but the join includes channel_requests without checking their status

14. **Reports - week filter logic complex** (`app/dashboard/reports/page.tsx`)
    - The `.or()` filter for date ranges with NULL handling is hard to read and may not cover all cases

15. **Pathways page - color picker in modal** (`app/dashboard/pathways/page.tsx`)
    - Uses native `<input type="color">` which looks different across browsers
    - Should use the existing `ColorPicker` component

---

## 3. Page Load Check

| Page | Status | Notes |
|------|--------|-------|
| `/dashboard` | ⚠️ Partial | Widgets don't load due to race condition |
| `/dashboard/events` | ✅ | Loads correctly |
| `/dashboard/events/new` | ✅ | Loads correctly |
| `/dashboard/events/[id]` | ⚠️ | Modal styled inline, AddChannelSimple unused |
| `/dashboard/events/[id]/edit` | ⚠️ | Channel request date handling issues |
| `/dashboard/calendar` | ⚠️ | Date filtering may miss records |
| `/dashboard/ministries` | ✅ | Loads correctly |
| `/dashboard/pathways` | ✅ | Loads correctly |
| `/dashboard/graphic-sizes` | ✅ | Loads correctly |
| `/dashboard/reports` | ⚠️ | PDF generation may fail |
| `/dashboard/settings` | 🔴 | No role protection |
| `/dashboard/admin` | 🔴 | No role protection |
| `/login` | ✅ | Should work |
| `/register` | ✅ | Should work |

---

## 4. Suggestions for Improvement

### High Priority

1. **Add role-based access control middleware**
   - Create a HOC or wrapper that checks user roles before rendering protected pages
   - Apply to: Settings, Admin, Reports (already checks but inconsistently)

2. **Fix dashboard data loading race condition**
   - Move role checking before data fetch, or use `useUserRoles` hook consistently
   - Add loading states per widget instead of global loading

3. **Add debounce to global search**
   - Add 300-500ms debounce to prevent excessive API calls

### Medium Priority

4. **Replace inline modals with consistent component**
   - Use `Modal` component everywhere, or create a dedicated `AddChannelModal`
   - Delete unused `AddChannelSimple` component

5. **Add delete confirmation dialogs consistently**
   - Replace all `window.confirm()` with `ConfirmDialog` component

6. **Improve calendar date query**
   - Use `requested_start_date` and `requested_end_date` for filtering instead of relying on `production_due_date`
   - Add separate query for execution dates with proper status filtering

7. **Add pending approval filter to admin page**
   - Allow sorting/filtering users by approval status
   - Show count of pending users prominently

8. **Add dashboard widgets for Ministry Team Members**
   - Currently only Admin and Designer widgets exist
   - Ministry team members see empty dashboard

### Low Priority / Nice to Have

9. **Add breadcrumbs to pages**
   - Help users navigate back from detail/edit pages

10. **Add keyboard shortcuts**
    - `Esc` to close modals
    - `Cmd/Ctrl + S` to save forms

11. **Add "last updated" timestamps to lists**
    - Show when data was last refreshed
    - Add manual refresh button

12. **Improve PDF export**
    - Use a different PDF library or upgrade `@react-pdf/renderer`
    - Add more formatting to weekly report (logos, better spacing)

13. **Add dark mode support**
    - The app uses a light theme consistently
    - Could add theme toggle for late-night users

14. **Add bulk actions to tables**
    - Select multiple items to delete/deactivate
    - Useful for admin bulk management

15. **Add activity log / audit trail**
    - Track who approved/denied requests
    - Track content generation events

---

## 5. Summary

**Strengths:**
- Clean build, no TypeScript errors
- Good component architecture (reusable UI components)
- Role-based UI rendering works well for most parts
- Calendar view is comprehensive with execution/production toggle

**Weaknesses:**
- Several pages lack role protection
- Dashboard widgets for admin/designer don't load due to race condition
- Inline HTML styles mixed with Tailwind classes
- No loading states per section (global loading only)

**Overall Assessment:** The app is functional and well-structured. The critical issues are around data loading race conditions and missing role protections. These should be addressed before any production deployment.