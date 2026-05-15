# Dear Agents

This file captures my general coding preferences for projects where I work with
coding agents. Project-specific instructions may override this file, but when
there is no local guidance, use these defaults.

## General Philosophy

Prefer clear, boring, maintainable code over clever code. The goal is not to
show off an abstraction; the goal is to make the system easier to understand,
change, and trust.

Work with the shape of the existing codebase. Match its conventions where they
are reasonable, and avoid introducing a new style unless it clearly improves the
code.

## File Size

Keep files small where possible. As a general rule, a file over 200 lines should
make you pause and ask whether it should be split up.

This is especially important for view-oriented files, including:

- SwiftUI views
- React components
- HTML templates
- ERB templates
- other UI or presentation-layer files

Large views are usually a sign that the file contains too many responsibilities.
Break them into smaller views, partials, components, helper functions, or
presentation objects as appropriate for the framework.

The 200-line guideline is not absolute. Some files are naturally longer, such as:

- DTOs or schema-heavy files
- test files
- generated files
- configuration files
- files where splitting would make the code harder to follow

Do not split files mechanically just to satisfy a line count. Split files when it
improves comprehension, isolates responsibility, or makes future changes easier.

## Comments

Use comments sparingly. Most comments should be one or two lines at most.

Good comments explain why the code exists, why a surprising choice was made, or
what constraint the code is preserving. Avoid comments that merely restate what
the code already says.

Prefer this:

```js
// Keep this calculation server-side so discount rules stay consistent across clients.
```

Avoid this:

```js
// Calculate the discount.
```

If a block of code needs a long explanation, first consider whether the code can
be renamed, simplified, or extracted so the explanation becomes unnecessary.

## Function Size

Prefer small functions. A function under 20 lines is usually easier to read,
test, name, and reuse.

This is a guideline, not a hard rule. A 25-line function with a clear linear
flow is better than five tiny functions that obscure what is happening. But when
a function grows past 30 lines, pause and look for hidden responsibilities. When
a function grows past 50 lines, assume it should probably be split unless there
is a strong reason to keep it together.

Good reasons to extract include:

- a distinct business rule
- a meaningful transformation
- validation logic
- branching that can be named
- setup or formatting code that distracts from the main flow

Do not create tiny functions just to satisfy a line count. Extract when the new
function has a clear name and a coherent responsibility.

## Function Parameters

Prefer functions with 0-3 parameters.

When a function needs more than 3 parameters, use named parameters, keyword
arguments, an options object, or a small value object where the language supports
it. Long positional parameter lists are hard to read and easy to misuse.

Prefer this:

```ts
createUser({
  name,
  email,
  role,
  sendInvite: true,
});
```

Avoid this:

```ts
createUser(name, email, role, true);
```

Boolean positional parameters are especially hard to read. Prefer named options
for flags unless the meaning is completely obvious from the function name and
type.

There are reasonable exceptions, such as low-level geometry or numeric helpers
where the parameters are conventional and obvious, like `rect(x, y, width,
height)`. In application and domain code, though, more than 3 parameters should
usually make you reach for names.

## Change Scope

Prefer the smallest coherent change, not necessarily the smallest diff.

Follow the principle: make the change easy, then make the easy change.

It is acceptable to refactor nearby code first when doing so makes the actual
change simpler, safer, or easier to understand. This is especially true when the
current structure would force new behavior into the wrong place.

Do not opportunistically refactor unrelated code. Preparatory refactoring should
be clearly connected to the change being made.

When practical, separate refactoring from behavior changes so each step is easier
to review and verify.

## Testing

Do not write tests for testing's sake. Tests should buy confidence in behavior
that matters.

Prioritize testing:

- complicated domain logic
- important business rules
- edge cases that are easy to break
- code with meaningful branching or transformations
- behavior that would be expensive or risky to verify manually

Avoid tests that mostly verify mocks, framework behavior, or implementation
details. A test that proves a mock was called is often less useful than a test
that proves real behavior is correct.

My overarching testing philosophy is:

> Isolate complexity, then test the complexity in isolation.

If complicated logic is embedded inside a React component, SwiftUI view, Rails
view, or other presentation-layer file, do not reach first for a heavy view test.
Move the logic into a function, object, hook, service, or other small unit that
can be tested directly.

Views should be as dumb as practical. They should mostly compose data, render
state, and delegate behavior. Trust the framework for ordinary rendering and
event plumbing unless there is a specific reason not to.

Most React component tests and view tests are unnecessary when the view is kept
simple and the meaningful logic is tested elsewhere. Use view tests when they
cover real integration risk or user-visible behavior that cannot be tested more
directly.

## When Editing Code

Before adding a new abstraction, ask whether it removes real complexity or just
moves code around. Prefer small, explicit pieces over broad abstractions that
try to predict the future.

When a file grows too large, look for natural boundaries:

- domain logic that can move out of a view
- repeated UI fragments that can become components or partials
- data-shaping code that can become a helper or presenter
- validation or calculation logic that can become a focused function

Keep the public surface area small. Extract code because it clarifies a real
responsibility, not because extraction is automatically better.
