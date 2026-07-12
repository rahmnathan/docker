# Keycloak Client Role Access Gates

Use this when a protected app should only be accessible to users with that
app's client role. This is enforced in Keycloak, so app code and Gateway/Ingress
configuration do not need to know about roles.

## Model

- Keep one realm: `NathanRahm`.
- Each protected app has a Keycloak client, for example `frigate`.
- Each protected client has an `access` client role.
- Users must have `<client-id>:access` to log in to that client.

Examples:

- `frigate:access` allows `frigate.nathanrahm.com`.
- `ollama:access` allows apps sharing the `ollama` client.
- `localmovies:access` allows the movies app.

Apps that share one Keycloak client also share one access boundary.

## Per-Client Browser Flow

For a client named `frigate`:

1. Open Keycloak Admin Console.
2. Select realm `NathanRahm`.
3. Go to `Authentication` -> `Flows`.
4. Duplicate the built-in `browser` flow.
5. Name the new flow `browser-frigate-access`.
6. Add a top-level sub-flow near the end of the flow named
   `require-frigate-access`.
7. Set `require-frigate-access` requirement to `Conditional`.
8. Inside `require-frigate-access`, add `Condition - user role`.
9. Configure `Condition - user role`:
   - `Role`: `frigate access`
   - `Negate output`: `On`
10. Inside the same sub-flow, add `Deny Access`.
11. Set `Deny Access` requirement to `Required`.
12. Go to `Clients` -> `frigate` -> `Advanced`.
13. Set `Authentication flow overrides` -> `Browser Flow` to
    `browser-frigate-access`.
14. Save.

The conditional flow reads as:

```text
if user does not have frigate:access:
  deny access
else:
  continue login
```

Place the role gate at the top level of the browser flow, after Keycloak has a
user identity. Do not hide it only inside the username/password form sub-flow,
because existing SSO sessions can otherwise skip the check.

## Repeat For Other Clients

For each protected client, duplicate the browser flow and change only the flow
name and role condition.

| Client | Flow name | Required role |
| --- | --- | --- |
| `frigate` | `browser-frigate-access` | `frigate:access` |
| `ollama` | `browser-ollama-access` | `ollama:access` |
| `localmovies` | `browser-localmovies-access` | `localmovies:access` |

## Testing

After changing a client flow, clear cookies or use a private browser window for:

- `login.nathanrahm.com`
- the app hostname, for example `frigate.nathanrahm.com`

Test both cases:

- a user with `<client-id>:access` should complete login.
- a user without `<client-id>:access` should be denied by Keycloak.

If a user still gets in unexpectedly, check for an existing Keycloak SSO session
or app session cookie before changing the flow again.
