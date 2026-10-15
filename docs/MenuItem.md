
# MenuItem

One sidebar entry. An extension declares its entries in `frontend.menu` of its manifest, where `group` and `permission` are required. Only a core extension may leave them out: an entry without a `group` is top-level, and one without a `permission` is seen by every signed-in user. 

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
`badge` | string
`createRoute` | string

## Example

```typescript
import type { MenuItem } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "key": null,
  "group": null,
  "order": null,
  "icon": null,
  "label": null,
  "route": null,
  "permission": null,
  "badge": null,
  "createRoute": null,
} satisfies MenuItem

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as MenuItem
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


