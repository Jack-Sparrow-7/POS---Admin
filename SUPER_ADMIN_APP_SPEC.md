# Super Admin App Specification (POS SaaS)

## 1) Product Overview

### Purpose
The Super Admin app is the control panel for platform-level operations in the POS SaaS system.
It is used by a platform operator (you) to onboard and manage tenants, create/manage stores, monitor platform health, and enforce access/security policies.

### Primary User
- Super Admin (platform operator)

### Secondary Users (future)
- Support staff with limited admin permissions
- Finance/reconciliation admin
- Operations admin

## 2) Product Goals

- Fast onboarding of new tenants and stores
- Full visibility into platform growth and account status
- Minimal friction for day-to-day admin actions
- Stable and secure auth/session handling
- Scalable structure to add advanced modules later

## 3) Non-Goals (for initial build)

- Full BI analytics suite
- Role hierarchy editor for sub-admins
- Complex workflow engine
- Public-facing CMS functionality

## 4) Information Architecture

### Top-Level Modules
- Authentication
- Dashboard
- Tenant Management
- Store Management
- Platform Monitoring
- Billing & Subscription (phase 2)
- Audit & Logs (phase 2)
- Settings

### Suggested Route Map
- /login
- /dashboard
- /tenants
- /tenants/:tenantId
- /stores
- /stores/:storeId
- /monitoring
- /billing
- /audit-logs
- /settings

## 5) Core Entities

### PlatformAdmin
- id
- email
- name
- isActive
- createdAt
- updatedAt

### Tenant
- id
- name
- email
- phone
- address
- city
- state
- pincode
- isActive
- createdAt
- updatedAt

### Store
- id
- tenantId
- name
- slug
- description
- address
- city
- state
- pincode
- phone
- gstin
- subscriptionStatus
- isActive
- createdAt
- updatedAt

## 6) Functional Requirements

### 6.1 Authentication
- Email/password login for super admin
- Session persistence (access token + refresh strategy)
- Route protection for private screens
- Logout clears local session and returns to /login
- Friendly error states for invalid credentials/network issues

### 6.2 Dashboard
- KPI cards:
  - Total Tenants
  - Total Stores
  - Avg Stores per Tenant
  - Pending Setup Tenants
- Recent activity widget (tenant/store create/update events)
- Quick actions:
  - Create Tenant
  - Create Store
- Error banner for API failures

### 6.3 Tenant Management
- List tenants (search + status filter)
- Create tenant
- View tenant details
- Edit tenant profile
- Activate/deactivate tenant
- Show linked stores count

### 6.4 Store Management
- List stores (search + tenant filter + status filter)
- Create store
- View store details
- Edit store profile
- Activate/deactivate store
- Store subscription summary

### 6.5 Platform Monitoring
- Health cards:
  - API availability
  - Auth error rate
  - Payment webhook status
- Operational alerts panel
- Basic timeline of recent critical events

### 6.6 Billing & Subscription (phase 2)
- View subscription status by store
- Trial expiry tracking
- Upgrade/suspend actions

### 6.7 Audit Logs (phase 2)
- List privileged actions
- Filters by action type/admin/date range
- Export (CSV) support

### 6.8 Settings
- Profile (admin name, password update)
- Security settings (session timeout config placeholder)
- Feature flags display (read-only in phase 1)

## 7) Screen-by-Screen Design Brief

## Login Screen
### Objective
Authenticate super admin quickly and safely.

### How It Should Look
- Clean single-focus layout with centered authentication card
- Neutral background with subtle depth (no heavy gradients)
- Strong page title and short support text above fields
- Card should feel secure and professional, not decorative

### Layout Structure
- Top area: brand mark + app name
- Middle area: login card
- Bottom area (optional): app version/help text

### Required UI Blocks
- Brand/title block
- Login form fields:
  - Email
  - Password
- Primary button: Sign In
- Secondary action (optional): Forgot password (future)
- Inline validation and error strip
- Loading state on submit

### Interactions
- Enter key submits form
- Disable submit while loading
- Navigate to dashboard on success

### Empty/Error States
- Invalid credentials
- Network unavailable
- Server unavailable

## Dashboard Screen
### Objective
Give instant platform snapshot and shortcuts.

### How It Should Look
- One clear header row + KPI band + operations sections
- Balanced information density, no visual clutter
- Cards/tables should align on a strict grid
- Action buttons visible but not dominant over data

### Layout Structure
- Header row:
  - Screen title (Dashboard)
  - Signed-in admin context
  - Sign out + refresh actions
- KPI row:
  - 3 to 5 metric cards in one row on desktop
  - 1-column stack on mobile
- Main body:
  - Left: quick actions and recent activity
  - Right: platform alerts/health summary

### Required UI Blocks
- Header with user context and sign out
- KPI row/cards
- Quick create section
- Recent changes list
- Platform notices/alerts

### Interactions
- Pull-to-refresh / refresh action
- KPI cards route to filtered lists
- Quick create opens inline form or modal

## Tenants List Screen
### Objective
Find and manage tenants quickly.

### How It Should Look
- Data-first table/list layout
- Sticky filter/search bar at top
- Clear row hierarchy and readable action column
- Status should be chip/badge based (active/inactive)

### Layout Structure
- Header line with title + Create Tenant button
- Control bar:
  - Search input
  - Status filter chips
  - Optional sort dropdown
- Data region:
  - Desktop: table
  - Mobile: card list with compact actions
- Footer region:
  - Pagination and total item count

### Required UI Blocks
- Search bar
- Status filter chips (All/Active/Inactive)
- Table/list with columns:
  - Name
  - Email
  - Phone
  - Stores Count
  - Status
  - Actions
- Pagination controls (if needed)

### Actions
- View details
- Edit
- Activate/Deactivate

## Tenant Detail Screen
### Objective
Manage a single tenant with full context.

### How It Should Look
- Profile-summary at top, editable sections below
- Screen should feel like an account workspace
- Important status controls always visible near header

### Layout Structure
- Top header:
  - Tenant name
  - Status chip
  - Activate/Deactivate
  - Edit/Save controls
- Content sections:
  - Basic info
  - Contact/address info
  - Linked stores
  - Activity snapshot

### Required UI Blocks
- Tenant summary card
- Editable profile section
- Linked stores list
- Activity snippet

### Actions
- Save changes
- Activate/Deactivate
- Create store under tenant

## Stores List Screen
### Objective
Manage and inspect all stores.

### How It Should Look
- Similar visual language as Tenants List for consistency
- Strong filters row because data slice is wider
- Subscription and status should be visually scannable

### Layout Structure
- Header with title + Create Store button
- Filter/search row:
  - Search
  - Tenant filter
  - Status filter
  - Subscription filter
- Data area:
  - Desktop table
  - Mobile stacked cards
- Bottom:
  - Pagination

### Required UI Blocks
- Search bar
- Filters (tenant, status, subscription)
- Table/list with columns:
  - Store
  - Tenant
  - Slug
  - Subscription
  - Status
  - Actions

### Actions
- View details
- Edit
- Activate/Deactivate

## Store Detail Screen
### Objective
Manage store configuration and status.

### How It Should Look
- Structured settings-style detail page
- Major store identity info at top
- Operational sections grouped with clear headings

### Layout Structure
- Header:
  - Store name + slug
  - Status + subscription state
  - Activate/Deactivate and Save actions
- Sections:
  - Store profile
  - Contact/location
  - Tax and legal (GST etc.)
  - Payment provider summary

### Required UI Blocks
- Store profile summary
- Contact/address info
- Subscription info
- Payment configuration summary

### Actions
- Save changes
- Activate/Deactivate
- Navigate to tenant

## Monitoring Screen
### Objective
Track operational health at a glance.

### How It Should Look
- Triage-oriented dashboard style
- Severity-based visual hierarchy
- "Current status" should be visible immediately without scrolling

### Layout Structure
- Top: health cards row (API/auth/payment/webhooks)
- Middle: active alerts/incident feed
- Bottom: timeline of recent events

### Required UI Blocks
- Status cards
- Incident/event list
- Last updated timestamp

### Actions
- Refresh
- Drill down to logs (future)

## Billing Screen (Phase 2)
### Objective
Track subscription lifecycle and risk.

### How It Should Look
- Revenue and risk emphasis
- Clear segmentation: active/trial/expiring/suspended

### Layout Structure
- KPI strip (MRR, active stores, expiring soon)
- Expiring soon table
- Suspended accounts table

### Required UI Blocks
- Subscription KPIs
- Expiring soon list
- Suspended list

## Audit Logs Screen (Phase 2)
### Objective
Provide traceability for critical admin actions.

### How It Should Look
- Log explorer style, high readability
- Filter controls always visible
- Action metadata easy to scan

### Layout Structure
- Filter row (action type/admin/date range/search)
- Log table with sticky header
- Export/action panel

### Required UI Blocks
- Action log table
- Filters + date range
- Export button

## Settings Screen
### Objective
Manage admin profile and preferences.

### How It Should Look
- Form-centric page with grouped cards
- Low cognitive load and explicit save/cancel flow

### Layout Structure
- Profile card
- Security card
- App/environment info card
- Action footer (Save/Discard)

### Required UI Blocks
- Profile form
- Security section
- App info/version

## 7.1 Global UI Standards Across All Screens

### Visual Consistency Rules
- Keep one visual system for cards, tables, forms, and buttons
- Maintain consistent radius, border, and spacing scales
- Avoid decorative elements that do not support task completion

### Spacing and Rhythm
- Use fixed spacing scale (example: 4, 8, 12, 16, 24, 32)
- Maintain predictable vertical rhythm between sections
- Keep table rows and form groups evenly spaced

### Typography Hierarchy
- H1: page title
- H2/H3: section titles
- Body: row/form content
- Caption: helper text, timestamps, metadata

### States Needed on Every Data Screen
- Loading skeleton or spinner
- Empty state with action hint
- Error state with retry button
- Success feedback for create/update actions

### Action Pattern
- One primary action per screen header
- Secondary actions grouped to the right
- Destructive actions visually distinct and confirmable

## 8) API Integration Outline

### Auth
- POST /auth/login
- POST /auth/refresh
- POST /auth/logout

### Tenant Admin
- GET /admin/tenants
- POST /admin/tenants
- PATCH /admin/tenants/:id
- GET /admin/tenants/:id

### Store Admin
- GET /admin/stores
- POST /admin/stores
- PATCH /admin/stores/:id
- GET /admin/stores/:id

Note: Keep endpoint constants centralized in one file for type-safe usage.

## 9) UX Rules

- Keep layouts simple and readable
- Prefer predictable CRUD flows over clever interactions
- Use consistent spacing and typography scale
- Keep forms short and grouped logically
- Use progressive disclosure for advanced settings
- Avoid visual clutter; keep one primary action per section

## 10) Responsive Behavior

- Mobile:
  - Single column
  - Bottom spacing for forms
  - Compact cards
- Tablet/Desktop:
  - Two-column sections where useful
  - Data-heavy tables in wider layouts

## 11) State Management Expectations

- Session state:
  - current user
  - access token
  - auth status
- Feature state:
  - loading/success/error
  - list data
  - create/update action state
- Keep side effects in repository/service layer

## 12) Error Handling Requirements

- API error mapped to user-friendly message
- Connection errors clearly indicated
- Retry actions on failed sections
- Validation errors shown inline for forms

## 13) Security Requirements

- Auth routes protected
- Super admin-only access to app routes
- Token refresh flow in network layer
- Secure storage strategy for auth tokens (implementation detail by platform)

## 14) Suggested Build Order

1. Login + session guard
2. Dashboard KPIs + quick create
3. Tenant list + create + edit
4. Store list + create + edit
5. Monitoring baseline
6. Billing phase 2
7. Audit logs phase 2
8. Settings polish

## 15) Definition of Done (Phase 1)

- Super admin login works reliably
- Dashboard shows accurate KPI data
- Tenant CRUD (create/read/update/activate/deactivate) works
- Store CRUD (create/read/update/activate/deactivate) works
- All private routes are protected
- Error/loading/empty states implemented per screen
- Responsive layout verified on mobile + desktop

## 16) Design Handoff Checklist

Before UI implementation starts, define:
- Typography scale (h1/h2/body/caption)
- Spacing scale (4/8/12/16/24 etc.)
- Card/table/form patterns
- State visuals (loading/error/empty/success)
- Navigation model (side rail vs top tabs)
- Interaction patterns (modals vs inline forms)

---

If needed, this doc can be converted into:
- A page-by-page wireframe checklist
- A component inventory file
- A Flutter implementation task list (ticket-ready)
