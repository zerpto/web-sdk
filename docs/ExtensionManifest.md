
# ExtensionManifest

The `manifest.yaml` an extension serves, here in JSON form.  The `key` names the extension, and is also the DNS name of its service. Ports follow the platform\'s conventions, so a manifest carries no backend address and no container image. Permission keys, the entry keys of `menu` and `settings_menu`, and published topics start with `key`, and a manifest that collides with another extension is refused. An entry key is used once across both menus. 

## Properties

Name | Type
------------ | -------------
`key` | string
`name` | string
`description` | string
`version` | string
`coreApi` | string
`requires` | [ManifestRequires](ManifestRequires.md)
`backend` | [ManifestBackend](ManifestBackend.md)
`frontend` | [ManifestFrontend](ManifestFrontend.md)

## Example

```typescript
import type { ExtensionManifest } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "key": null,
  "name": null,
  "description": null,
  "version": null,
  "coreApi": null,
  "requires": null,
  "backend": null,
  "frontend": null,
} satisfies ExtensionManifest

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ExtensionManifest
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


