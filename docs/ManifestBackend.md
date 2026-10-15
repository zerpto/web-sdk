
# ManifestBackend


## Properties

Name | Type
------------ | -------------
`publishes` | Array&lt;string&gt;
`permissions` | [Array&lt;ManifestPermission&gt;](ManifestPermission.md)

## Example

```typescript
import type { ManifestBackend } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "publishes": null,
  "permissions": null,
} satisfies ManifestBackend

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ManifestBackend
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


