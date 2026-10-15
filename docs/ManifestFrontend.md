
# ManifestFrontend


## Properties

Name | Type
------------ | -------------
`mode` | string
`remote` | string
`expose` | string
`shared` | { [key: string]: string; }
`menu` | [Array&lt;MenuItem&gt;](MenuItem.md)
`settingsMenu` | [Array&lt;SettingsMenuItem&gt;](SettingsMenuItem.md)

## Example

```typescript
import type { ManifestFrontend } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "mode": null,
  "remote": null,
  "expose": null,
  "shared": null,
  "menu": null,
  "settingsMenu": null,
} satisfies ManifestFrontend

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ManifestFrontend
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


