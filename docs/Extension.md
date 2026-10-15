
# Extension


## Properties

Name | Type
------------ | -------------
`id` | string
`key` | string
`name` | string
`description` | string
`version` | string
`party` | string
`core` | boolean
`status` | [ExtensionStatus](ExtensionStatus.md)
`enabled` | boolean
`manifestUrl` | string
`manifest` | [ExtensionManifest](ExtensionManifest.md)
`pendingManifest` | [ExtensionManifest](ExtensionManifest.md)
`rejectionReason` | string
`reviewedAt` | Date
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { Extension } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "key": null,
  "name": null,
  "description": null,
  "version": null,
  "party": null,
  "core": null,
  "status": null,
  "enabled": null,
  "manifestUrl": null,
  "manifest": null,
  "pendingManifest": null,
  "rejectionReason": null,
  "reviewedAt": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies Extension

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Extension
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


