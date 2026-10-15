
# ExtensionStatus

`pending_review`: registered, never approved. `approved`: live; a changed manifest may still be waiting in `pending_manifest`. `rejected`: the registration was refused. 

## Properties

Name | Type
------------ | -------------

## Example

```typescript
import type { ExtensionStatus } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
} satisfies ExtensionStatus

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ExtensionStatus
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


