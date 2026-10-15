# ExtensionsApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**approveExtension**](ExtensionsApi.md#approveextension) | **POST** /v1/iam/extensions/{id}/approve | Approve a reviewed manifest |
| [**disableExtension**](ExtensionsApi.md#disableextension) | **POST** /v1/iam/extensions/{id}/disable | Disable an extension |
| [**enableExtension**](ExtensionsApi.md#enableextension) | **POST** /v1/iam/extensions/{id}/enable | Enable an extension |
| [**getExtension**](ExtensionsApi.md#getextension) | **GET** /v1/iam/extensions/{id} | Get an extension |
| [**getMenu**](ExtensionsApi.md#getmenu) | **GET** /v1/iam/menu | Get sidebar and settings menu |
| [**listExtensions**](ExtensionsApi.md#listextensions) | **GET** /v1/iam/extensions | List extensions |
| [**refreshExtension**](ExtensionsApi.md#refreshextension) | **POST** /v1/iam/extensions/{id}/refresh | Fetch the manifest again |
| [**registerExtension**](ExtensionsApi.md#registerextension) | **POST** /v1/iam/extensions | Register an extension |
| [**rejectExtension**](ExtensionsApi.md#rejectextension) | **POST** /v1/iam/extensions/{id}/reject | Reject a reviewed manifest |



## approveExtension

> ExtensionResponse approveExtension(id)

Approve a reviewed manifest

Accepts the manifest waiting for review, whether it is a new registration or a change to an approved extension. It becomes the live &#x60;manifest&#x60;, and its permissions, menu entries and settings entries take effect. A newly approved extension is enabled for tenants created afterwards, but stays disabled for existing tenants.  Read the &#x60;pending_manifest&#x60; first with [&#x60;GET /v1/iam/extensions/{id}&#x60;](#tag/extensions/GET/v1/iam/extensions/{id}). Existing tenants switch a new extension on with [&#x60;POST /v1/iam/extensions/{id}/enable&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/enable). For tenants that already use the extension, a change applies at once, and any dependency it adds is enabled for them too. Every required extension must be approved in a version that satisfies the range, or the call fails. Only the platform operator can call it.  Error codes: &#x60;nothing_to_review&#x60;, &#x60;dependency_not_satisfied&#x60;, &#x60;core_api_unsupported&#x60;, &#x60;key_collision&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ExtensionsApi,
} from '@zerpto/sdk';
import type { ApproveExtensionRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // To configure API key authorization: PlatformKey
    apiKey: "YOUR API KEY",
  });
  const api = new ExtensionsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies ApproveExtensionRequest;

  try {
    const data = await api.approveExtension(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | `string` | Resource ID. | [Defaults to `undefined`] |

### Return type

[**ExtensionResponse**](ExtensionResponse.md)

### Authorization

[PlatformKey](../README.md#PlatformKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Manifest approved |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## disableExtension

> ExtensionResponse disableExtension(id)

Disable an extension

Switches an extension off for the current tenant. Its menu and settings entries disappear and its permissions stop applying, but the data it holds is kept, and roles keep its permission keys for when it is enabled again. It is refused for a core extension and while another enabled extension depends on this one.  Check which extensions are enabled with [&#x60;GET /v1/iam/extensions&#x60;](#tag/extensions/GET/v1/iam/extensions), and disable the dependents first. Dependencies that were enabled along with it stay enabled. Switch it back on with [&#x60;POST /v1/iam/extensions/{id}/enable&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/enable), and reload the sidebar with [&#x60;GET /v1/iam/menu&#x60;](#tag/extensions/GET/v1/iam/menu). It needs a tenant admin with &#x60;iam.extensions.manage&#x60;.  Error codes: &#x60;extension_is_core&#x60;, &#x60;extension_required&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ExtensionsApi,
} from '@zerpto/sdk';
import type { DisableExtensionRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ExtensionsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies DisableExtensionRequest;

  try {
    const data = await api.disableExtension(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | `string` | Resource ID. | [Defaults to `undefined`] |

### Return type

[**ExtensionResponse**](ExtensionResponse.md)

### Authorization

[UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Extension disabled |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user may not do this. The error &#x60;code&#x60; says why: &#x60;permission_denied&#x60; when the role or key lacks the permission, &#x60;plan_required&#x60; when the tenant\&#39;s plan does not include the feature (the &#x60;message&#x60; names the feature key), and &#x60;read_only_user&#x60; when the user is read-only and the call writes. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## enableExtension

> ExtensionEnableResponse enableExtension(id)

Enable an extension

Switches an approved extension on for the current tenant, together with every extension it depends on. Its permissions, menu entries and settings entries then apply to the tenant\&#39;s users, within what their roles and the current seat plan allow. There is no separate subscription per extension. Enabling it again changes nothing.  Pick the id from [&#x60;GET /v1/iam/extensions&#x60;](#tag/extensions/GET/v1/iam/extensions). Afterwards reload the sidebar with [&#x60;GET /v1/iam/menu&#x60;](#tag/extensions/GET/v1/iam/menu) and the user\&#39;s permissions with [&#x60;GET /v1/auth/me&#x60;](#tag/authentication/GET/v1/auth/me). Switch it off again with [&#x60;POST /v1/iam/extensions/{id}/disable&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/disable). Paid permissions stay locked while the plan lacks them, see [&#x60;GET /v1/iam/permissions&#x60;](#tag/roles-and-permissions/GET/v1/iam/permissions). It needs a tenant admin with &#x60;iam.extensions.manage&#x60;.  Error codes: none specific.  **Response meta** - &#x60;also_enabled&#x60;: keys of the dependencies this call switched on. Empty when there were none. 

### Example

```ts
import {
  Configuration,
  ExtensionsApi,
} from '@zerpto/sdk';
import type { EnableExtensionRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ExtensionsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies EnableExtensionRequest;

  try {
    const data = await api.enableExtension(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | `string` | Resource ID. | [Defaults to `undefined`] |

### Return type

[**ExtensionEnableResponse**](ExtensionEnableResponse.md)

### Authorization

[UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Extension enabled |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user may not do this. The error &#x60;code&#x60; says why: &#x60;permission_denied&#x60; when the role or key lacks the permission, &#x60;plan_required&#x60; when the tenant\&#39;s plan does not include the feature (the &#x60;message&#x60; names the feature key), and &#x60;read_only_user&#x60; when the user is read-only and the call writes. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## getExtension

> ExtensionResponse getExtension(id)

Get an extension

Returns one extension by its &#x60;id&#x60;: its key, version, status, party and manifest. The platform operator also sees a manifest waiting for review, the manifest address and the last rejection reason. A signed-in user can open only approved extensions, and sees whether their tenant has it enabled.  The id comes from [&#x60;GET /v1/iam/extensions&#x60;](#tag/extensions/GET/v1/iam/extensions) or from the response of [&#x60;POST /v1/iam/extensions&#x60;](#tag/extensions/POST/v1/iam/extensions). The operator continues with [&#x60;POST /v1/iam/extensions/{id}/approve&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/approve), [&#x60;POST /v1/iam/extensions/{id}/reject&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/reject) or [&#x60;POST /v1/iam/extensions/{id}/refresh&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/refresh). A tenant admin continues with [&#x60;POST /v1/iam/extensions/{id}/enable&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/enable) or [&#x60;POST /v1/iam/extensions/{id}/disable&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/disable). An extension that is not approved is not found for a signed-in user.  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ExtensionsApi,
} from '@zerpto/sdk';
import type { GetExtensionRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // To configure API key authorization: PlatformKey
    apiKey: "YOUR API KEY",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ExtensionsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetExtensionRequest;

  try {
    const data = await api.getExtension(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | `string` | Resource ID. | [Defaults to `undefined`] |

### Return type

[**ExtensionResponse**](ExtensionResponse.md)

### Authorization

[PlatformKey](../README.md#PlatformKey), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## getMenu

> MenuResponse getMenu()

Get sidebar and settings menu

Returns the sidebar menu and the tenant settings menu for the signed-in user in the current tenant. Both hold only what enabled extensions add, the user\&#39;s permissions allow and the seat plan includes. The filtering is cosmetic, since every service still checks permissions. Personal settings are not included.  Call it after [&#x60;POST /v1/auth/sign-in&#x60;](#tag/authentication/POST/v1/auth/sign-in), and again after [&#x60;POST /v1/auth/switch-tenant&#x60;](#tag/authentication/POST/v1/auth/switch-tenant), [&#x60;POST /v1/iam/extensions/{id}/enable&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/enable) or [&#x60;POST /v1/iam/extensions/{id}/disable&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/disable). Sort the top-level &#x60;items&#x60; and the &#x60;groups&#x60; together by &#x60;order&#x60;, then the entries inside each group by their own &#x60;order&#x60;. Groups with no visible entry are left out. Arrange &#x60;settings&#x60; the same way, sorting &#x60;settings.items&#x60; and &#x60;settings.groups&#x60; together on a scale that is separate from the sidebar\&#39;s. A read-only user holds no write permission, so an entry of either menu that needs one is left out, and no entry has a &#x60;create_route&#x60;.  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ExtensionsApi,
} from '@zerpto/sdk';
import type { GetMenuRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ExtensionsApi(config);

  try {
    const data = await api.getMenu();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**MenuResponse**](MenuResponse.md)

### Authorization

[UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## listExtensions

> ExtensionListResponse listExtensions(perPage, page, status)

List extensions

Lists extensions, one page at a time. The platform operator sees every extension in every status, including the manifests waiting for review. A signed-in user sees only the approved ones, each with &#x60;enabled&#x60; saying whether their tenant uses it. Use it for a registry console or a tenant\&#39;s settings page.  The platform operator adds extensions with [&#x60;POST /v1/iam/extensions&#x60;](#tag/extensions/POST/v1/iam/extensions). Open one with [&#x60;GET /v1/iam/extensions/{id}&#x60;](#tag/extensions/GET/v1/iam/extensions/{id}). A tenant admin switches one on or off with [&#x60;POST /v1/iam/extensions/{id}/enable&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/enable) and [&#x60;POST /v1/iam/extensions/{id}/disable&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/disable). The core extensions are always listed as approved, and enabled for every tenant. Filtering by &#x60;status&#x60; other than &#x60;approved&#x60; returns nothing to a signed-in user.  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  ExtensionsApi,
} from '@zerpto/sdk';
import type { ListExtensionsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // To configure API key authorization: PlatformKey
    apiKey: "YOUR API KEY",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ExtensionsApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
    // ExtensionStatus | Filter by review status. (optional)
    status: ...,
  } satisfies ListExtensionsRequest;

  try {
    const data = await api.listExtensions(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **perPage** | `number` | Page size. | [Optional] [Defaults to `25`] |
| **page** | `number` | Page number, starting at 1. | [Optional] [Defaults to `1`] |
| **status** | `ExtensionStatus` | Filter by review status. | [Optional] [Defaults to `undefined`] [Enum: pending_review, approved, rejected] |

### Return type

[**ExtensionListResponse**](ExtensionListResponse.md)

### Authorization

[PlatformKey](../README.md#PlatformKey), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## refreshExtension

> ExtensionResponse refreshExtension(id)

Fetch the manifest again

Fetches the manifest of a registered extension again from its &#x60;manifest_url&#x60;. A manifest that differs from the approved one is stored as &#x60;pending_manifest&#x60; and waits for review, while the approved version stays live for tenants. An unchanged manifest leaves nothing to review. Only the platform operator can call it.  Find the extension with [&#x60;GET /v1/iam/extensions&#x60;](#tag/extensions/GET/v1/iam/extensions). Review a changed manifest with [&#x60;POST /v1/iam/extensions/{id}/approve&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/approve) or [&#x60;POST /v1/iam/extensions/{id}/reject&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/reject). A newer fetch replaces a manifest that is still waiting. A rejected registration goes back to &#x60;pending_review&#x60; when it is fetched again. The &#x60;key&#x60; in the manifest can\&#39;t change. Core extensions are updated with the platform, not here.  Error codes: &#x60;extension_is_core&#x60;, &#x60;url_not_allowed&#x60;, &#x60;manifest_unreachable&#x60;, &#x60;invalid_manifest&#x60;, &#x60;core_api_unsupported&#x60;, &#x60;key_mismatch&#x60;, &#x60;unknown_dependency&#x60;, &#x60;key_collision&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ExtensionsApi,
} from '@zerpto/sdk';
import type { RefreshExtensionRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // To configure API key authorization: PlatformKey
    apiKey: "YOUR API KEY",
  });
  const api = new ExtensionsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies RefreshExtensionRequest;

  try {
    const data = await api.refreshExtension(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | `string` | Resource ID. | [Defaults to `undefined`] |

### Return type

[**ExtensionResponse**](ExtensionResponse.md)

### Authorization

[PlatformKey](../README.md#PlatformKey)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Manifest fetched |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## registerExtension

> ExtensionResponse registerExtension(extensionInput)

Register an extension

Registers a first-party extension from the address of its &#x60;manifest.yaml&#x60;, which IAM fetches and checks. The address must use HTTPS or point to an internal host the installation allows. The result waits for review in &#x60;pending_review&#x60;, and no tenant can see or use it yet. Only the platform operator can call it.  Review the returned &#x60;pending_manifest&#x60;, then call [&#x60;POST /v1/iam/extensions/{id}/approve&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/approve) or [&#x60;POST /v1/iam/extensions/{id}/reject&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/reject) with the returned &#x60;id&#x60;. To pick up a later change of the manifest, use [&#x60;POST /v1/iam/extensions/{id}/refresh&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/refresh) and don\&#39;t register again. Every extension named in &#x60;requires.services&#x60; must already be registered, and permission keys, topics and the entry keys of both menus must start with the extension\&#39;s own &#x60;key&#x60; and be unused, and every settings route must start with &#x60;/settings/&#x60;. The core extensions are installed with the platform and can\&#39;t be registered here.  Error codes: &#x60;url_not_allowed&#x60;, &#x60;manifest_unreachable&#x60;, &#x60;invalid_manifest&#x60;, &#x60;core_api_unsupported&#x60;, &#x60;extension_exists&#x60;, &#x60;core_extension&#x60;, &#x60;unknown_dependency&#x60;, &#x60;key_collision&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ExtensionsApi,
} from '@zerpto/sdk';
import type { RegisterExtensionRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // To configure API key authorization: PlatformKey
    apiKey: "YOUR API KEY",
  });
  const api = new ExtensionsApi(config);

  const body = {
    // ExtensionInput
    extensionInput: ...,
  } satisfies RegisterExtensionRequest;

  try {
    const data = await api.registerExtension(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **extensionInput** | [ExtensionInput](ExtensionInput.md) |  | |

### Return type

[**ExtensionResponse**](ExtensionResponse.md)

### Authorization

[PlatformKey](../README.md#PlatformKey)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Extension registered and waiting for review. |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## rejectExtension

> ExtensionResponse rejectExtension(id, extensionRejectInput)

Reject a reviewed manifest

Refuses the manifest waiting for review and records why. A new registration becomes &#x60;rejected&#x60; and no tenant can use it. A refused change to an approved extension is discarded, and the approved version stays live as before. The reason is shown to the platform operator, so the author can be told what to fix.  Read the &#x60;pending_manifest&#x60; first with [&#x60;GET /v1/iam/extensions/{id}&#x60;](#tag/extensions/GET/v1/iam/extensions/{id}). After the manifest is corrected, fetch it with [&#x60;POST /v1/iam/extensions/{id}/refresh&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/refresh) and review it again, ending with [&#x60;POST /v1/iam/extensions/{id}/approve&#x60;](#tag/extensions/POST/v1/iam/extensions/{id}/approve) or another rejection. The &#x60;rejection_reason&#x60; is cleared when a later manifest is approved. Only the platform operator can call it.  Error codes: &#x60;nothing_to_review&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ExtensionsApi,
} from '@zerpto/sdk';
import type { RejectExtensionRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // To configure API key authorization: PlatformKey
    apiKey: "YOUR API KEY",
  });
  const api = new ExtensionsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // ExtensionRejectInput
    extensionRejectInput: ...,
  } satisfies RejectExtensionRequest;

  try {
    const data = await api.rejectExtension(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | `string` | Resource ID. | [Defaults to `undefined`] |
| **extensionRejectInput** | [ExtensionRejectInput](ExtensionRejectInput.md) |  | |

### Return type

[**ExtensionResponse**](ExtensionResponse.md)

### Authorization

[PlatformKey](../README.md#PlatformKey)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Manifest rejected |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

