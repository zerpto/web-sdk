
# ManifestRequires

What the extension needs from others. Core extensions are always available and are not listed in `services`.

## Properties

Name | Type
------------ | -------------
`services` | Array&lt;string&gt;
`grpc` | Array&lt;string&gt;
`topics` | Array&lt;string&gt;
`permissions` | Array&lt;string&gt;

## Example

```typescript
import type { ManifestRequires } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "services": null,
  "grpc": null,
  "topics": null,
  "permissions": null,
} satisfies ManifestRequires

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ManifestRequires
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


