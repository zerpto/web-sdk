
# SettingsMenu

The tenant settings menu, arranged like the sidebar. Entries outside any group and the groups share one `order` scale, which is separate from the sidebar\'s. Both arrays are empty when the user may see no entry.

## Properties

Name | Type
------------ | -------------
`items` | [Array&lt;SettingsMenuItem&gt;](SettingsMenuItem.md)
`groups` | [Array&lt;MenuGroup&gt;](MenuGroup.md)

## Example

```typescript
import type { SettingsMenu } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "items": null,
  "groups": null,
} satisfies SettingsMenu

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as SettingsMenu
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


