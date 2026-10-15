
# SettingsMenuItem

One entry of the tenant settings menu, either in a group or on its own. An extension declares its entries in `frontend.settings_menu` of its manifest, where `group` is written as null for an entry outside any group. 

## Properties

Name | Type
------------ | -------------
`key` | string
`group` | string
`order` | number
`icon` | string
`label` | [LocalizedText](LocalizedText.md)
`route` | string
`permission` | string

## Example

```typescript
import type { SettingsMenuItem } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "key": null,
  "group": null,
  "order": null,
  "icon": null,
  "label": null,
  "route": null,
  "permission": null,
} satisfies SettingsMenuItem

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as SettingsMenuItem
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


