
# MenuGroup

A group of the sidebar or of the tenant settings menu, owned by the core, with the entries extensions add to it.  A sidebar group (`groups`) has the key `sales`, `purchases`, `inventory`, `accounting`, `tax-assets` or `catalog` and holds `MenuItem` entries. A settings group (`settings.groups`) has the key `organization`, `finance`, `developers` or `billing` and holds `SettingsMenuItem` entries. 

## Properties

Name | Type
------------ | -------------
`key` | string
`order` | number
`label` | [LocalizedText](LocalizedText.md)
`items` | [Array&lt;MenuGroupItemsInner&gt;](MenuGroupItemsInner.md)

## Example

```typescript
import type { MenuGroup } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "key": null,
  "order": null,
  "label": null,
  "items": null,
} satisfies MenuGroup

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as MenuGroup
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


