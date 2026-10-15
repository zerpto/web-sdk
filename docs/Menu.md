
# Menu


## Properties

Name | Type
------------ | -------------
`items` | [Array&lt;MenuItem&gt;](MenuItem.md)
`groups` | [Array&lt;MenuGroup&gt;](MenuGroup.md)
`settings` | [SettingsMenu](SettingsMenu.md)

## Example

```typescript
import type { Menu } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "items": null,
  "groups": null,
  "settings": null,
} satisfies Menu

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Menu
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


