# Keycloak Client Setup for Mealie

## Create OIDC Client

1. Login to Keycloak at https://login.nathanrahm.com
2. Select the `NathanRahm` realm
3. Go to **Clients** → **Create client**

### General Settings
- **Client type**: OpenID Connect
- **Client ID**: `mealie`
- **Name**: Mealie Recipes
- **Description**: Recipe management application

### Capability Config
- **Client authentication**: ON (enables confidential client with secret)
- **Authorization**: OFF
- **Authentication flow**: Check only "Standard flow"

### Login Settings
- **Root URL**: `https://recipes.nathanrahm.com`
- **Home URL**: `https://recipes.nathanrahm.com`
- **Valid redirect URIs**: `https://recipes.nathanrahm.com/*`
- **Valid post logout redirect URIs**: `https://recipes.nathanrahm.com/*`
- **Web origins**: `https://recipes.nathanrahm.com`

Click **Save**

## Get Client Secret

1. Go to **Clients** → **mealie** → **Credentials** tab
2. Copy the **Client secret**
3. Update `/home/nathan/development/workspaces/docker/kubernetes/mealie/secrets.yaml` with this secret

## Create Groups (Optional)

If you want admin group functionality:

1. Go to **Groups** → **Create group**
2. Create a group named `mealie-admin`
3. Add users to this group who should have admin access

## Configure Client Scopes (for groups claim)

1. Go to **Client scopes** → **Create client scope**
   - Name: `groups`
   - Type: Default
   - Protocol: OpenID Connect
2. Go to **Mappers** tab → **Configure a new mapper** → **Group Membership**
   - Name: `groups`
   - Token Claim Name: `groups`
   - Full group path: OFF
   - Add to ID token: ON
   - Add to access token: ON
   - Add to userinfo: ON
3. Go to **Clients** → **mealie** → **Client scopes** tab
4. Click **Add client scope** → select `groups` → Add as Default

## Role-Based Access Gate (Optional)

To restrict access to only users with `mealie:access` role (following your existing pattern):

1. Go to **Clients** → **mealie** → **Roles** tab
2. Click **Create role** → Name: `access`
3. Go to **Authentication** → **Flows**
4. Duplicate the `browser` flow, name it `browser-mealie-access`
5. Add a top-level **Conditional** sub-flow named `require-mealie-access`
6. Inside, add **Condition - user role**:
   - Role: `mealie access`
   - Negate output: ON
7. Inside the same sub-flow, add **Deny Access** (Required)
8. Go to **Clients** → **mealie** → **Advanced** tab
9. Set **Browser Flow** to `browser-mealie-access`
10. Assign `mealie:access` role to users who should have access

## Deploy

After updating the secret:

```bash
kubectl create namespace mealie
kubectl apply -f mealie/secrets.yaml
helm upgrade --install -n mealie mealie ./mealie
```
