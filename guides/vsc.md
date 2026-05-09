# VSC Configuration

I personally use [VSCodium](https://github.com/VSCodium/vscodium) instead of VSC, as VSC contains telemetry/tracker - [VSC developer comment](https://github.com/Microsoft/vscode/issues/60#issuecomment-161792005).

Stops VSC to send telemetry, crash reports, disable online experiments, turn off automatic updates (manual updates), prevent fetching release notes, stop automatic extension and git repository updates, limit extension recommendations to on demand requests, and block fetching package information from online sources like NPM or Bower.

## App Settings

These settings are personal preference, the listed ones below cause VCS to appear more minimal/compact. 

- `editor.wordWrap`: on
- `extensions.ignoreRecommendations`: true
- `update.showReleaseNotes`: false
- `window.commandCenter`: false
- `window.menuBarVisibility`: compact
- `workbench.activityBar.location`: top
- `workbench.editor.wrapTabs`: true
- `workbench.layoutControl.enabled`: false
- `workbench.startupEditor`: none

## Telemetry Settings

Basically make sure everything in 'Settings > Application > Telemetry' is turned off/set to false.

- `telemetry.editStats.details.enabled`: true
- `telemetry.editStats.enabled`: true
- `telemetry.editStats.showDecorations`: true
- `telemetry.editStats.showStatusBar`: true
- `telemetry.enableCrashReporter`: false
- `telemetry.enableTelemetry`: false
- `telemetry.feedback.enabled`: false
- `telemetry.telemetryLevel`: off
- `workbench.enableExperiments`: false

```c
[{
  // "extensions.showRecommendationsOnlyOnDemand": true,
	"message": "This setting is deprecated. Use extensions.ignoreRecommendations setting to control recommendation notifications. Use Extensions view's visibility actions to hide Recommended view by default.",

  // "telemetry.enableCrashReporter": false,
	"message": "If this setting is false, no telemetry will be sent regardless of the new setting's value. Deprecated due to being combined into the `#telemetry.telemetryLevel#` setting.",

  // "telemetry.enableTelemetry": false,
	"message": "If this setting is false, no telemetry will be sent regardless of the new setting's value. Deprecated in favor of the `#telemetry.telemetryLevel#` setting.",
}]
```
```ts
// It exepects a string, means 0-3 are invalid (also "0"... are)
export const enum TelemetryLevel {
	NONE = 0, // off
	CRASH = 1, // crash
	ERROR = 2, // error
	USAGE = 3 // all
```
```json
"config.autofetch": "When set to true, commits will automatically be fetched from the default remote of the current Git repository. Setting to `all` will fetch from all remotes.",
```
```json
"config.npm.fetchOnlinePackageInfo": "Fetch data from https://registry.npmjs.org and https://registry.bower.io to provide auto-completion and information on hover features on npm dependencies.",
```
```ts
'update.mode': {
	enum: ['none', 'manual', 'start', 'default'],
	description: localize('updateMode', "Configure whether you receive automatic updates. Requires a restart after change. The updates are fetched from a Microsoft online service."),
	enumDescriptions: [
		localize('manual', "Disable automatic background update checks. Updates will be available if you manually check for updates."),
```

- https://github.com/microsoft/vscode/blob/274d71002ec805c8b4f61ade3f058dd3cac1aceb/src/vs/workbench/contrib/extensions/common/extensions.ts#L185
- https://github.com/microsoft/vscode/blob/274d71002ec805c8b4f61ade3f058dd3cac1aceb/extensions/git/package.nls.json#L155
- https://github.com/microsoft/vscode/blob/274d71002ec805c8b4f61ade3f058dd3cac1aceb/extensions/npm/package.nls.json#L26
- https://github.com/microsoft/vscode/blob/274d71002ec805c8b4f61ade3f058dd3cac1aceb/src/vs/platform/telemetry/common/telemetry.ts#L83
- https://github.com/microsoft/vscode/blob/274d71002ec805c8b4f61ade3f058dd3cac1aceb/src/vs/workbench/services/assignment/common/assignmentService.ts#L110