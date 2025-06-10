# mcore_gh_actions

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Actions](#actions)
  - [auto_build_number](#auto_build_number)
    - [Description](#description)
    - [Inputs](#inputs)
    - [Outputs](#outputs)
    - [YAML](#yaml)
  - [dart_jfrog_ssdlc](#dart_jfrog_ssdlc)
    - [Description](#description-1)
    - [Inputs](#inputs-1)
    - [Outputs](#outputs-1)
    - [YAML](#yaml-1)
  - [dart_publish](#dart_publish)
    - [Description](#description-2)
    - [Inputs](#inputs-2)
    - [Outputs](#outputs-2)
    - [YAML](#yaml-2)
  - [dart_validate](#dart_validate)
    - [Description](#description-3)
    - [Inputs](#inputs-3)
    - [Outputs](#outputs-3)
    - [YAML](#yaml-3)
  - [dart_vulnerability_scan](#dart_vulnerability_scan)
    - [Description](#description-4)
    - [Inputs](#inputs-4)
    - [Outputs](#outputs-4)
    - [YAML](#yaml-4)
  - [generate_markdown_toc](#generate_markdown_toc)
    - [Description](#description-5)
    - [Inputs](#inputs-5)
    - [Outputs](#outputs-5)
    - [YAML](#yaml-5)
  - [setup_flutter](#setup_flutter)
    - [Description](#description-6)
    - [Inputs](#inputs-6)
    - [Outputs](#outputs-6)
    - [YAML](#yaml-6)
  - [scan_pubspec](#scan_pubspec)
    - [Description](#description-7)
    - [Inputs](#inputs-7)
    - [Outputs](#outputs-7)
    - [YAML](#yaml-7)
  - [setup_jfrog](#setup_jfrog)
    - [Description](#description-8)
    - [Inputs](#inputs-8)
    - [Outputs](#outputs-8)
    - [YAML](#yaml-8)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

---

## Actions

### auto_build_number

#### Description

<!-- action_description: .github/actions/auto_build_number/action.yaml -->
Provide a unique auto-incrementing build number.  The build number will be stored in a text file in the repository using an orphan branch.  If the branch does not exist, it will be created.  The build number will be incremented each time the action is run. 
<!-- /action_description -->

#### Inputs

<!-- action_inputs: .github/actions/auto_build_number/action.yaml -->
Name | Required | Default | Description
--- | --- | --- | ---
`branch` | No | `build_number` | Branch to use to host the build.number file.
`fileName` | No | `build.number` | Name of the build.number file.
<!-- /action_inputs -->

#### Outputs

<!-- action_outputs: .github/actions/auto_build_number/action.yaml -->
Name | Description
--- | ---
`BUILD_NUMBER` | The build number to use.
<!-- /action_outputs -->

#### YAML

<details>
<summary>action.yaml</summary>


<!-- file: .github/actions/auto_build_number/action.yaml -->

```yaml
name: 'Auto Build Number'
description: |
  Provide a unique auto-incrementing build number.  The build number will be
  stored in a text file in the repository using an orphan branch.  If the branch
  does not exist, it will be created.  The build number will be incremented each
  time the action is run.
inputs:
  branch:
    description: 'Branch to use to host the build.number file.'
    required: false
    default: 'build_number'
  fileName:
    description: 'Name of the build.number file.'
    required: false
    default: 'build.number'

outputs:
  BUILD_NUMBER:
    description: The build number to use.
    value: ${{ steps.build-number.outputs.BUILD_NUMBER }}

runs:
  using: 'composite'
  steps:
    - name: Setup Dart
      id: set-up-dart
      uses: dart-lang/setup-dart@v1
      with:
        sdk: 'stable'

    - name: Create action directory
      shell: bash
      run: |
        set -e
        mkdir -p ${{ github.workspace }}/action

    - name: Activate the auto build number action
      shell: bash
      run: |
        set -e
        # In order for `dart pub global activate` to work with path, it is 
        # mandatory to wrap the target path in double quotes.
        dart pub global activate -s path ".github/mcore_gh_actions/packages/action_auto_build_number/"

    - name: Set up Github Action Identity
      shell: bash
      run: |
        git config --global user.name "action"
        git config --global user.email "noop@github.com"

    - name: Create Build Number
      shell: bash
      id: build-number
      run: |
        set -e
        dart pub global run auto_build_number:increment_build_number --branch ${{ inputs.branch }} --file ${{ inputs.fileName }}

    - name: Echo Build Number
      shell: bash
      run: |
        set -e
        echo "Build number is ${{ steps.build-number.outputs.BUILD_NUMBER }}"

```


<!-- /file -->
</details>

---

### dart_jfrog_ssdlc

#### Description

<!-- action_description: .github/actions/dart_jfrog_ssdlc/action.yaml -->
Performs the SSDLC actions required by the security team with regard to JFrog for Dart and Flutter based packages.  This action requires that the Dart SDK is installed and available in the path and that the JFrog CLI is already installed. 
<!-- /action_description -->

#### Inputs

<!-- action_inputs: .github/actions/dart_jfrog_ssdlc/action.yaml -->
Name | Required | Default | Description
--- | --- | --- | ---
`jfrog-release-project` | No | `dge` | The JFrog release project to use for the RBv2 promotion.
`jfrog-token` | **Yes** | _<n/a>_ | JFrog authentication token
`lock-file` | No | _<n/a>_ | Path to the pubspec.lock file to validate.  Typically only required for monorepos.
`path` | No | `.` | Path to the Dart / Flutter package to perform the XRay scan against
`pub-url` | No | `https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub` | URL to the Dart package repository
`rbv2-signing-key` | No | `mgmkey` | The RBv2 signing key to use for the RBv2 promotion.
`temp-dir` | No | `temp` | Directory to use for temporary files.
`token` | **Yes** | _<n/a>_ | The GitHub token to use for authentication.
`xray` | No | `true` | Set to false to disable xray scanning
<!-- /action_inputs -->

#### Outputs

<!-- action_outputs: .github/actions/dart_jfrog_ssdlc/action.yaml -->
No outputs
<!-- /action_outputs -->

#### YAML

<details>
<summary>action.yaml</summary>

<!-- file: .github/actions/dart_jfrog_ssdlc/action.yaml -->

```yaml
name: Dart JFrog SSDLC
description: |
  Performs the SSDLC actions required by the security team with regard to JFrog
  for Dart and Flutter based packages.  This action requires that the Dart SDK
  is installed and available in the path and that the JFrog CLI is already
  installed.
inputs:
  jfrog-release-project:
    default: 'dge'
    description: The JFrog release project to use for the RBv2 promotion.
    required: false
  jfrog-token:
    description: JFrog authentication token
    required: true
  lock-file:
    default: ''
    description: Path to the pubspec.lock file to validate.  Typically only required for monorepos.
    required: false
  path:
    default: .
    description: Path to the Dart / Flutter package to perform the XRay scan against
    required: false
  pub-url:
    default: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    description: URL to the Dart package repository
    required: false
  rbv2-signing-key:
    default: 'mgmkey'
    description: The RBv2 signing key to use for the RBv2 promotion.
    required: false
  temp-dir:
    default: temp
    description: Directory to use for temporary files.
    required: false
  token:
    description: The GitHub token to use for authentication.
    required: true
  xray:
    default: 'true'
    description: Set to false to disable xray scanning
    required: false

runs:
  using: 'composite'
  steps:
    - name: Extract Pubspec Info
      uses: ./.github/mcore_gh_actions/.github/actions/scan_pubspec
      id: extract-pubspec-info
      with:
        path: ${{ inputs.path }}

    - name: Parse Repo URL
      shell: bash
      run: |
        echo "PUB_REPO=`echo ${{ inputs.pub-url }} | sed 's@.*\/@ @g'`" >> $GITHUB_ENV

    - name: Parse Repo URL
      shell: bash
      run: |
        echo "JFROG_BASE_URL=https://`echo ${{ inputs.pub-url }} | awk -F/ '{print $3}'`" >> $GITHUB_ENV

    - name: Check and Setup Build ID
      shell: bash
      id: set_build_id
      run: |
        echo "BUILD_ID=${{ steps.extract-pubspec-info.outputs.PUBSPEC_VERSION }}" >> $GITHUB_ENV

    - name: Echo Lock file (default)
      if: inputs.lock-file == ''
      shell: bash
      run: |
        echo "Using default lock file"
        echo "LOCK_FILE=${{ inputs.path}}/pubspec.lock" >> $GITHUB_ENV

    - name: Set the JFrog Token
      shell: bash
      run: echo JFROG_TOKEN=${{ inputs.jfrog-token }} >> $GITHUB_ENV

    - name: Echo Lock file (custom)
      if: inputs.lock-file != ''
      shell: bash
      run: |
        echo "Using custom lock file: ${{ inputs.lock-file }}"
        echo "LOCK_FILE=${{ inputs.lock-file }}" >> $GITHUB_ENV

    - name: Show JFrog CLI Config
      shell: bash
      run: |
        export "JFROG_CLI_LOG_LEVEL=DEBUG"
        jf config show

    # 2025-05-27: The XRay scan is currently disabled due to issues with the
    # JFrog CLI and the Dart package format.  This command is correct for other
    # package formats so it is included, but commented out, to simplify adding
    # it when the JFrog XRay supports Dart packages.
    #
    # - name: Run XRay Scan
    #   shell: bash
    #   run: |
    #     jf scan \
    #       --recursive=true \
    #       --format=json \
    #       --fail=true \
    #       ${{ inputs.path}}/lib/ \
    #       ${{ inputs.path}}/test/ \
    #       ${{ inputs.path}}/pubspec.yaml \
    #       ${{ env.LOCK_FILE}} \
    #       --build-name=${{ steps.extract-pubspec-info.outputs.PUBSPEC_NAME }} \
    #       --build-number=${{ env.BUILD_ID }} \

    # Creates the Release Bundle v2 (RBv2) spec file for the package.
    # The specifics of the RBv2 spec file are defined in here:
    # https://jfrog.com/help/r/jfrog-integrations-documentation/using-file-specs
    - name: RBv2 Spec - Create
      shell: bash
      run: |
        echo "{ \"files\": [{\"pattern\": \"${{ env.PUB_REPO }}/${{ steps.extract-pubspec-info.outputs.PUBSPEC_NAME}}/${{ steps.extract-pubspec-info.outputs.PUBSPEC_NAME}}-${{ env.BUILD_ID }}.tar.gz\"}] }" > RBv2-SPEC.json

    - name: RBv2 Spec - Print
      shell: bash
      run: cat RBv2-SPEC.json

    - name: RBv2 Create NEW
      shell: bash
      run: |
        jf rbc \
          ${{ steps.extract-pubspec-info.outputs.PUBSPEC_NAME}} \
          ${{ env.BUILD_ID }} \
          --sync="true" \
          --signing-key=${{ inputs.rbv2-signing-key }} \
          --project=${{ inputs.jfrog-release-project }} \
          --spec=RBv2-SPEC.json

    - name: RBv2 Promote PROD
      shell: bash
      run: |
        jf rbp \
          ${{ steps.extract-pubspec-info.outputs.PUBSPEC_NAME}} \
          ${{ steps.extract-pubspec-info.outputs.PUBSPEC_VERSION }} \
          PROD \
          --sync=true \
          --signing-key=${{ inputs.rbv2-signing-key }} \
          --project=${{ inputs.jfrog-release-project }}

    - name: Summarize RBv2 Operations
      shell: bash
      run: |-
        echo "# :frog: Release Bundle v2 Summary :rocket: " >> $GITHUB_STEP_SUMMARY
        echo "The Build Artifacts have been promoted to the subsequent stages." >> $GITHUB_STEP_SUMMARY
        RB2_STATUS_RESP=$(curl -v -G "${{ env.JFROG_BASE_URL }}/lifecycle/api/v2/promotion/records/${{ steps.extract-pubspec-info.outputs.PUBSPEC_NAME}}/${{ env.BUILD_ID }}?async=false&project=${{ inputs.jfrog-release-project }}" -H 'Content-Type: application/json' -H "Authorization: Bearer ${{ inputs.jfrog-token }}")
        echo $RB2_STATUS_RESP > RBv2_STATUS.json
        cat RBv2_STATUS.json
        items=$(echo "$RB2_STATUS_RESP" | jq -c -r '.promotions[]')
        for item in ${items[@]}; do \
          envVal=$(echo $item | jq -r '.environment'); \
          crtVal=$(echo $item | jq -r '.created'); \
          echo " - ${envVal} on ${crtVal} " >> $GITHUB_STEP_SUMMARY; \
        done
        echo " " >> $GITHUB_STEP_SUMMARY

```


<!-- /file -->
</details>

---

### dart_publish

#### Description

<!-- action_description: .github/actions/dart_publish/action.yaml -->
Publish a Dart package to a JFrog repository.  This action requires the JFrog token from the [setup_jfrog](#setup_jfrog) action.  This will perform all the validation provided by [dart_validate](#dart_validate), unless the `validate` input is `false`.

If any aspect of the validation fails, the build itself will fail and it will not attempt to publish the package to JFrog. 
<!-- /action_description -->

#### Inputs

<!-- action_inputs: .github/actions/dart_publish/action.yaml -->
Name | Required | Default | Description
--- | --- | --- | ---
`channel` | No | `stable` | Flutter channel to use.
`check-licenses` | No | `true` | Whether or not to perform the license check against the packages.
`code-coverage` | No | `80` | The percent of lines of code that must be covered by tests.  A value of "skip" will disable coverage evaluation.
`flutter-version` | No | `any` | Specific Flutter version to use.
`jfrog-ssdlc` | No | `true` | Whether to run JFrog SSDLC actions on the package.  This should only be false with security approvals.
`jfrog-token` | **Yes** | _<n/a>_ | JFrog authentication token
`jfrog-user` | **Yes** | _<n/a>_ | JFrog authentication user
`lock-file` | No | _<n/a>_ | Path to the pubspec.lock file to validate.  Typically only required for monorepos.
`path` | No | `.` | Path to the Dart package to publish
`pub-url` | No | `https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub` | URL to the Dart package repository
`test-defines` | No | _<n/a>_ | Test defines to pass to the test command
`test-flags` | No | _<n/a>_ | Test flags to pass to the test command
`token` | **Yes** | _<n/a>_ | The GitHub token to use for authentication.
`validate` | No | `true` | Whether to validate the package before publishing
`vulnerability-scan` | No | `true` | Whether to run a vulnerability scan on the package
<!-- /action_inputs -->

#### Outputs

<!-- action_outputs: .github/actions/dart_publish/action.yaml -->
No outputs
<!-- /action_outputs -->

#### YAML

<details>
<summary>action.yaml</summary>

<!-- file: .github/actions/dart_publish/action.yaml -->

```yaml
name: Dart Publish
description: |
  Publish a Dart package to a JFrog repository.  This action requires the JFrog
  token from the [setup_jfrog](#setup_jfrog) action.  This will perform all the
  validation provided by [dart_validate](#dart_validate), unless the `validate`
  input is `false`.

  If any aspect of the validation fails, the build itself will fail and it will
  not attempt to publish the package to JFrog.
inputs:
  channel:
    default: stable
    description: Flutter channel to use.
    required: false
  check-licenses:
    default: 'true'
    description: Whether or not to perform the license check against the packages.
    required: false
  code-coverage:
    default: '80'
    description: The percent of lines of code that must be covered by tests.  A value of "skip" will disable coverage evaluation.
    required: false
  flutter-version:
    default: any
    description: Specific Flutter version to use.
    required: false
  jfrog-ssdlc:
    default: 'true'
    description: Whether to run JFrog SSDLC actions on the package.  This should only be false with security approvals.
    required: false
  jfrog-token:
    description: JFrog authentication token
    required: true
  jfrog-user:
    description: JFrog authentication user
    required: true
  lock-file:
    default: ''
    description: Path to the pubspec.lock file to validate.  Typically only required for monorepos.
    required: false
  path:
    default: .
    description: Path to the Dart package to publish
    required: false
  pub-url:
    default: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    description: URL to the Dart package repository
    required: false
  test-defines:
    default: ''
    description: Test defines to pass to the test command
    required: false
  test-flags:
    default: ''
    description: Test flags to pass to the test command
    required: false
  token:
    description: The GitHub token to use for authentication.
    required: true
  validate:
    default: 'true'
    description: Whether to validate the package before publishing
    required: false
  vulnerability-scan:
    default: 'true'
    description: Whether to run a vulnerability scan on the package
    required: false

runs:
  using: 'composite'
  steps:
    - name: Set Pub URL
      shell: bash
      run: |
        set -e
        if test "${{ inputs.pub-url }}" != ""; then
          echo "PUB_HOSTED_URL=${{ inputs.pub-url }}" >> $GITHUB_ENV
        fi

    - name: Validate
      if: ${{ inputs.validate }} == "true"
      uses: ./.github/mcore_gh_actions/.github/actions/dart_validate
      with:
        channel: ${{ inputs.channel }}
        check-licenses: ${{ inputs.check-licenses }}
        code-coverage: ${{ inputs.code-coverage }}
        flutter-version: ${{ inputs.flutter-version }}
        jfrog-token: ${{ inputs.jfrog-token }}
        lock-file: ${{ inputs.lock-file }}
        path: ${{ inputs.path }}
        pub-url: ${{ inputs.pub-url }}
        publish-dry-run: 'false'
        test-defines: ${{ inputs.test-defines }}
        test-flags: ${{ inputs.test-flags }}
        token: ${{ inputs.token }}
        vulnerability-scan: ${{ inputs.vulnerability-scan }}

    - name: Publish
      shell: bash
      run: |-
        set -e
        echo "Publishing package..."
        dart pub publish --force
      working-directory: ${{ inputs.path }}

    - name: JFrog SSDLC
      if: ${{ inputs.jfrog-ssdlc }} == "true"
      uses: ./.github/mcore_gh_actions/.github/actions/dart_jfrog_ssdlc
      with:
        jfrog-token: ${{ inputs.jfrog-token }}
        lock-file: ${{ inputs.lock-file }}
        path: ${{ inputs.path }}
        pub-url: ${{ inputs.pub-url }}
        token: ${{ inputs.token }}

```


<!-- /file -->
</details>

---

### dart_validate

#### Description

<!-- action_description: .github/actions/dart_validate/action.yaml -->
Performs formatting, analysis, and testing of Dart and Flutter packages using the built in tools.  This action can autodetect if the package is a Dart package or a Flutter package and will run the appropriate commands for each. Finally, this will validate the code coverage percent is at least the  `code-coverage` level, though it will disable the coverage check if that value is set to "skip".

This will perform a license check against the package including all dependencies, both direct and transient.  The list of licenses allowed can be found in the [license.yaml](./.github/config/license.yaml) file.  Whenever a new MGM package is added, it will need to be added to the list of overrides using the `MGMRI` license.  Otherwise, the license scanner will fail on that license due to the license being flagged as unknown.  The license scanner can be disabled by setting `check-licenses` to `false`.

A vulnerability scan will be performed against the package including all dependencies, both direct and transient.  The output of the vulnerability scan will be a standard SARIF file that will then be uploaded to the GitHub Security section.  If any vulnerabilities are found, the build will fail.  The vulnerability scan can be disabled by setting `vulnerability-scan` to 
<!-- /action_description -->

#### Inputs

<!-- action_inputs: .github/actions/dart_validate/action.yaml -->
Name | Required | Default | Description
--- | --- | --- | ---
`channel` | No | `stable` | Flutter channel to use.
`check-licenses` | No | `true` | Whether or not to perform the license check against the packages.
`code-coverage` | No | `80` | The percent of lines of code that must be covered by tests.  A value of "skip" will disable coverage evaluation.
`flutter-version` | No | `any` | Specific Flutter version to use.
`jfrog-token` | **Yes** | _<n/a>_ | JFrog authentication token
`lock-file` | No | _<n/a>_ | Path to the pubspec.lock file to validate.  Typically only required for monorepos.
`path` | No | `.` | Path to the Dart / Flutter package to validate
`pub-url` | No | `https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub` | URL to the Dart package repository
`publish-dry-run` | No | `true` | Whether or not to perform a dry run of the publish command.
`test-defines` | No | _<n/a>_ | Test defines to pass to the test command
`test-flags` | No | _<n/a>_ | Test flags to pass to the test command
`token` | **Yes** | _<n/a>_ | The GitHub token to use for authentication.
`vulnerability-scan` | No | `true` | Whether or not to run a vulnerability scan on the packages.
`validate-formatting` | No | `true` | Set to false to disable code formatting checks
<!-- /action_inputs -->

#### Outputs

<!-- action_outputs: .github/actions/dart_validate/action.yaml -->
No outputs
<!-- /action_outputs -->

#### YAML

<details>
<summary>action.yaml</summary>

<!-- file: .github/actions/dart_validate/action.yaml -->

```yaml
name: Dart Validate
description: |
  Performs formatting, analysis, and testing of Dart and Flutter packages using
  the built in tools.  This action can autodetect if the package is a Dart
  package or a Flutter package and will run the appropriate commands for each.
  Finally, this will validate the code coverage percent is at least the 
  `code-coverage` level, though it will disable the coverage check if that
  value is set to "skip".

  This will perform a license check against the package including all
  dependencies, both direct and transient.  The list of licenses allowed can be
  found in the [license.yaml](./.github/config/license.yaml) file.  Whenever a
  new MGM package is added, it will need to be added to the list of overrides
  using the `MGMRI` license.  Otherwise, the license scanner will fail on that
  license due to the license being flagged as unknown.  The license scanner can
  be disabled by setting `check-licenses` to `false`.

  A vulnerability scan will be performed against the package including all
  dependencies, both direct and transient.  The output of the vulnerability scan
  will be a standard SARIF file that will then be uploaded to the GitHub
  Security section.  If any vulnerabilities are found, the build will fail.  The
  vulnerability scan can be disabled by setting `vulnerability-scan` to

inputs:
  channel:
    default: stable
    description: Flutter channel to use.
    required: false
  check-licenses:
    default: 'true'
    description: Whether or not to perform the license check against the packages.
    required: false
  code-coverage:
    default: '80'
    description: The percent of lines of code that must be covered by tests.  A value of "skip" will disable coverage evaluation.
    required: false
  flutter-version:
    default: any
    description: Specific Flutter version to use.
    required: false
  jfrog-token:
    description: JFrog authentication token
    required: true
  lock-file:
    default: ''
    description: Path to the pubspec.lock file to validate.  Typically only required for monorepos.
    required: false
  path:
    default: .
    description: Path to the Dart / Flutter package to validate
    required: false
  pub-url:
    default: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    description: URL to the Dart package repository
    required: false
  publish-dry-run:
    default: 'true'
    description: Whether or not to perform a dry run of the publish command.
    required: false
  test-defines:
    default: ''
    description: Test defines to pass to the test command
    required: false
  test-flags:
    default: ''
    description: Test flags to pass to the test command
    required: false
  token:
    description: The GitHub token to use for authentication.
    required: true
  vulnerability-scan:
    default: 'true'
    description: Whether or not to run a vulnerability scan on the packages.
    required: false
  validate-formatting:
    default: 'true'
    description: Set to false to disable code formatting checks
    required: false

runs:
  using: 'composite'
  steps:
    - name: Setup Flutter
      uses: ./.github/mcore_gh_actions/.github/actions/setup_flutter
      with:
        channel: ${{ inputs.channel }}
        flutter-version: ${{ inputs.flutter-version }}
        jfrog-token: ${{ inputs.jfrog-token }}
        pub-url: ${{ inputs.pub-url }}

    - name: Validate
      shell: bash
      id: validate
      run: |
        set -e
        if grep -q flutter: "pubspec.yaml"; then 
          flutter packages get
          flutter doctor -v
          if test -d "example"; then
            cd example
            flutter pub get
            cd ..
          fi
          if test "${{ inputs.generate_code }}" = "true"; then
            dart run build_runner build --delete-conflicting-outputs -v
            if test -d "example"; then
              cd example
              if grep -q build_runner: "pubspec.yaml"; then 
                dart run build_runner build --delete-conflicting-outputs -v
              fi
              cd ..
            fi
          fi
          if test "${{ inputs.validate-formatting }}" = "true"; then
            dart format lib test --set-exit-if-changed
          fi
          flutter analyze
          flutter ${{ inputs.test-defines }} test --coverage ${{ inputs.test-flags }}
          if test -d "example"; then
            cd example
            if test "${{ inputs.validate-formatting }}" = "true"; then
              dart format lib --set-exit-if-changed
            fi
            if test -d "test"; then
              if test "${{ inputs.validate-formatting }}" = "true"; then
                dart format test --set-exit-if-changed
              fi
              flutter test
              cd ..
            fi
            cd ..
          fi
        else
          dart pub get
          flutter doctor -v
          if test -d "example"; then
            cd example
            dart pub get
            cd ..
          fi
          if test "${{ inputs.generate_code }}" = "true"; then
            dart run build_runner build --delete-conflicting-outputs -v
            if test -d "example"; then
              cd example
              if grep -q build_runner: "pubspec.yaml"; then 
                dart run build_runner build --delete-conflicting-outputs -v
              fi
              cd ..
            fi
          fi
          if test "${{ inputs.validate-formatting }}" = "true"; then
            dart format lib test --set-exit-if-changed
          fi
          dart analyze
          dart pub global activate coverage
          dart ${{ inputs.test-defines }} test --coverage="coverage" ${{ inputs.test-flags }}
          dart pub global run coverage:format_coverage --lcov --in=coverage --out=coverage/lcov.info --report-on=lib
          if test -d "example"; then
            cd example
            if test "${{ inputs.validate-formatting }}" = "true"; then
              dart format lib --set-exit-if-changed
            fi
            if test -d "test"; then
              if test "${{ inputs.validate-formatting }}" = "true"; then
                dart format test --set-exit-if-changed
              fi
              dart test
              cd ..
            fi
            cd ..
          fi
        fi
      working-directory: ${{ inputs.path }}

    - name: Is Test Coverage Skipped
      if: inputs.code-coverage == 'skip'
      shell: bash
      run: echo "Test coverage is skipped"

    - name: Is Test Coverage NOT Skipped
      if: inputs.code-coverage != 'skip'
      shell: bash
      run: echo "Test coverage is NOT skipped"

    - name: Test Coverage
      if: inputs.code-coverage != 'skip'
      uses: VeryGoodOpenSource/very_good_coverage@v3
      with:
        path: ${{ inputs.path }}/coverage/lcov.info
        min_coverage: ${{ inputs.code-coverage }}

    - name: Perform License Check
      if: inputs.check-licenses == 'true'
      shell: bash
      run: |
        set -e
        cp ./.github/mcore_gh_actions/.github/config/license.yaml ${{ inputs.path }}/licenses.yaml
        dart pub global activate license_checker2
        cd ${{ inputs.path }}
        lic_ck check-licenses -c licenses.yaml -a

    - name: Perform Vulnerability Scan
      if: inputs.vulnerability-scan == 'true'
      uses: ./.github/mcore_gh_actions/.github/actions/dart_vulnerability_scan
      with:
        lock-file: ${{ inputs.lock-file }}
        path: ${{ inputs.path }}
        token: ${{ inputs.token }}

    - name: Perform Publish Dry Run
      if: inputs.publish-dry-run != 'false'
      shell: bash
      run: |
        set -e
        dart pub publish --dry-run
      working-directory: ${{ inputs.path }}

```


<!-- /file -->
</details>

---

### dart_vulnerability_scan

#### Description

<!-- action_description: .github/actions/dart_vulnerability_scan/action.yaml -->
Perform Google based Vulnerability Scan
<!-- /action_description -->

#### Inputs

<!-- action_inputs: .github/actions/dart_vulnerability_scan/action.yaml -->
Name | Required | Default | Description
--- | --- | --- | ---
`lock-file` | No | _<n/a>_ | Path to the pubspec.lock file to validate.  Typically only required for monorepos.
`path` | No | `.` | Path to the Dart / Flutter package to validate
`token` | **Yes** | _<n/a>_ | GitHub Auth token for the repository
<!-- /action_inputs -->

#### Outputs

<!-- action_outputs: .github/actions/dart_vulnerability_scan/action.yaml -->
No outputs
<!-- /action_outputs -->

#### YAML

<details>
<summary>action.yaml</summary>

<!-- file: .github/actions/dart_vulnerability_scan/action.yaml -->

```yaml
name: Dart Vulnerability Scan
description: Perform Google based Vulnerability Scan
inputs:
  lock-file:
    default: ''
    description: Path to the pubspec.lock file to validate.  Typically only required for monorepos.
    required: false
  path:
    default: .
    description: Path to the Dart / Flutter package to validate
    required: false
  token:
    description: GitHub Auth token for the repository
    required: true

runs:
  using: 'composite'
  steps:
    - name: Extract package name from "pubspec.yaml"
      id: extract_package_name
      shell: bash
      run: |
        set -e
        if test -f "${{ inputs.path }}/pubspec.yaml"; then
          package_name=$(grep -m 1 '^name:' "${{ inputs.path }}/pubspec.yaml" | cut -d ' ' -f 2)
          echo "PACKAGE_NAME=${package_name}" >> $GITHUB_ENV
        else
          echo "No pubspec.yaml file found in the specified path."
          exit 1
        fi

    - name: Echo Lock file (default)
      if: inputs.lock-file == ''
      shell: bash
      run: |
        echo "Using default lock file"

    - name: Echo Lock file (custom)
      if: inputs.lock-file != ''
      shell: bash
      run: |
        echo "Using custom lock file: ${{ inputs.lock-file }}"

    # Docs: https://google.github.io/osv-scanner/github-action/
    # Releases: https://github.com/google/osv-scanner-action/tags
    - name: 'Run scanner with Default lock file'
      uses: google/osv-scanner-action/osv-scanner-action@v2.0.0
      if: inputs.lock-file == ''
      with:
        scan-args: |-
          --output=${{ inputs.path }}/results.json
          --format=json
          -r
          --lockfile ${{ inputs.path }}/pubspec.lock
          ${{inputs.path}}
      continue-on-error: true
    - name: 'Run scanner with Custom lock file'
      uses: google/osv-scanner-action/osv-scanner-action@v2.0.0
      if: inputs.lock-file != ''
      with:
        scan-args: |-
          --output=${{ inputs.path }}/results.json
          --format=json
          -r
          --lockfile ${{ inputs.lock-file }}
          ${{inputs.path}}
      continue-on-error: true
    - name: 'Run osv-scanner-reporter'
      uses: google/osv-scanner-action/osv-reporter-action@v2.0.0
      with:
        scan-args: |-
          --output=${{ inputs.path }}/${{ env.PACKAGE_NAME }}.sarif
          --new=${{ inputs.path }}/results.json
          --fail-on-vuln=true
    - name: 'Delete Existing artifact, if exists'
      uses: geekyeggo/delete-artifact@v5
      with:
        failOnError: false
        name: ${{ env.PACKAGE_NAME }}.sarif
    - name: 'Upload artifact'
      id: 'upload_artifact'
      if: ${{ !cancelled()}}
      uses: actions/upload-artifact@v4
      with:
        name: ${{ env.PACKAGE_NAME }}.sarif
        path: ${{ inputs.path }}/${{ env.PACKAGE_NAME }}.sarif
        retention-days: 5
    - name: 'Upload to code-scanning'
      if: ${{ !cancelled() }}
      uses: github/codeql-action/upload-sarif@v3
      with:
        category: security-${{ env.PACKAGE_NAME }}
        sarif_file: ${{ inputs.path }}/${{ env.PACKAGE_NAME }}.sarif

```


<!-- /file -->
</details>

---

### generate_markdown_toc

#### Description

<!-- action_description: .github/actions/generate_markdown_toc/action.yaml -->
Generate a Markdown Table of Contents for all Markdown files in the repository.
<!-- /action_description -->

#### Inputs

<!-- action_inputs: .github/actions/generate_markdown_toc/action.yaml -->
Name | Required | Default | Description
--- | --- | --- | ---
`commit` | No | `true` | Whether or not to commit the changes back to the repo
`commit-message` | No | `[actions skip]: Auto-generated Markdown TOCs` | The commit message to use when committing the changes.
`files` | No | `**/*.md` | The files to be processed by the action.
`token` | **Yes** | _<n/a>_ | The GitHub token to use for pushing the updates.
<!-- /action_inputs -->

#### Outputs

<!-- action_outputs: .github/actions/generate_markdown_toc/action.yaml -->
No outputs
<!-- /action_outputs -->

#### YAML

<details>
<summary>action.yaml</summary>

<!-- file: .github/actions/generate_markdown_toc/action.yaml -->

```yaml
name: Generate Markdown TOC
description: Generate a Markdown Table of Contents for all Markdown files in the repository.
inputs:
  commit:
    default: 'true'
    description: Whether or not to commit the changes back to the repo
    required: false
  commit-message:
    default: '[actions skip]: Auto-generated Markdown TOCs'
    description: The commit message to use when committing the changes.
    required: false
  files:
    default: '**/*.md'
    description: The files to be processed by the action.
    required: false
  token:
    description: The GitHub token to use for pushing the updates.
    required: true

runs:
  using: 'composite'
  steps:
    - name: Install Node Dependencies
      shell: bash
      run: |
        npm install -g doctoc

    - name: Process TOC
      shell: bash
      run: |
        doctoc . --github

    - name: Post Markdown to GitHub
      if: ${{ inputs.commit == 'true' }}
      uses: test-room-7/action-update-file@v1
      with:
        branch: ${{ github.head_ref || github.ref_name }}
        file-path: ${{ inputs.files }}
        commit-msg: ${{ inputs.commit-message }}
        github-token: ${{ inputs.token }}

```


<!-- /file -->
</details>

---

### setup_flutter

#### Description

<!-- action_description: .github/actions/setup_flutter/action.yaml -->
Sets up the Flutter SDK to prepare it for use within other workflows.  This action will install the Flutter SDK, set the Pub URL, and adds the JFrog  authentication token to the Dart token repository. 
<!-- /action_description -->

#### Inputs

<!-- action_inputs: .github/actions/setup_flutter/action.yaml -->
Name | Required | Default | Description
--- | --- | --- | ---
`channel` | No | `stable` | Flutter channel to use.
`flutter-version` | No | `any` | Specific Flutter version to use.
`jfrog-token` | **Yes** | _<n/a>_ | JFrog authentication token.
`pub-url` | No | `https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub` | URL to the Dart package repository.
<!-- /action_inputs -->

#### Outputs

<!-- action_outputs: .github/actions/setup_flutter/action.yaml -->
No outputs
<!-- /action_outputs -->

#### YAML

<details>
<summary>action.yaml</summary>

<!-- file: .github/actions/setup_flutter/action.yaml -->

```yaml
name: 'Setup Flutter'
description: |
  Sets up the Flutter SDK to prepare it for use within other workflows.  This
  action will install the Flutter SDK, set the Pub URL, and adds the JFrog 
  authentication token to the Dart token repository.
inputs:
  channel:
    default: stable
    description: Flutter channel to use.
    required: false
  flutter-version:
    default: any
    description: Specific Flutter version to use.
    required: false
  jfrog-token:
    description: JFrog authentication token.
    required: true
  pub-url:
    default: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    description: URL to the Dart package repository.
    required: false

runs:
  using: 'composite'
  steps:
    - name: Setup Flutter
      uses: subosito/flutter-action@v2
      with:
        channel: ${{ inputs.channel }}
        flutter-version: ${{ inputs.flutter-version }}

    - name: Set Pub URL
      shell: bash
      run: |
        set -e
        if test "${{ inputs.pub-url }}" != ""; then
          export PUB_HOSTED_URL=${{ inputs.pub-url }}
        fi

    - name: Add JFrog Token to Dart
      shell: bash
      run: |
        echo ${{ inputs.jfrog-token }} | dart pub token add ${{ inputs.pub-url }}

```


<!-- /file -->
</details>

---

### scan_pubspec

#### Description

<!-- action_description: .github/actions/scan_pubspec/action.yaml -->
Scans a pubspec.yaml file and makes the information available via GitHub  outputs.  This action requires that the Dart SDK is installed and available in the path. 
<!-- /action_description -->

#### Inputs

<!-- action_inputs: .github/actions/scan_pubspec/action.yaml -->
Name | Required | Default | Description
--- | --- | --- | ---
`path` | No | `.` | Path to pubspec.yaml file to scan.
<!-- /action_inputs -->

#### Outputs

<!-- action_outputs: .github/actions/scan_pubspec/action.yaml -->
Name | Description
--- | ---
`PUBSPEC_DESCRIPTION` | The desription from the pubspec.yaml file.
`PUBSPEC_FLUTTER_SDK` | Will be true if the pubspec.yaml file is for a Flutter package and false otherwise.
`PUBSPEC_NAME` | The name from the pubspec.yaml file.
`PUBSPEC_PUBLISH_TO` | The value set in the publish_to field of the pubspec.yaml file.
`PUBSPEC_REPOSITORY` | The repository or homepage value from the pubspec.yaml file.
`PUBSPEC_VERSION` | The full version from the pubspec.yaml file.
`PUBSPEC_VERSION_MAJOR` | The major value from the pubspec version.
`PUBSPEC_VERSION_MINOR` | The minor value from the pubspec version.
`PUBSPEC_VERSION_PATCH` | The patch value from the pubspec version.
`PUBSPEC_VERSION_PRE_RELEASE` | The prelease value from the pubspec version, if any.
<!-- /action_outputs -->

#### YAML

<details>
<summary>action.yaml</summary>

<!-- file: .github/actions/scan_pubspec/action.yaml -->

```yaml
name: Scan Pubspec
description: |
  Scans a pubspec.yaml file and makes the information available via GitHub 
  outputs.  This action requires that the Dart SDK is installed and available
  in the path.
inputs:
  path:
    default: .
    description: Path to pubspec.yaml file to scan.
    required: false

outputs:
  PUBSPEC_DESCRIPTION:
    description: The desription from the pubspec.yaml file.
    value: ${{ steps.scan-pubspec.outputs.PUBSPEC_DESCRIPTION }}
  PUBSPEC_FLUTTER_SDK:
    description: Will be true if the pubspec.yaml file is for a Flutter package and false otherwise.
    value: ${{ steps.scan-pubspec.outputs.PUBSPEC_FLUTTER_SDK }}
  PUBSPEC_NAME:
    description: The name from the pubspec.yaml file.
    value: ${{ steps.scan-pubspec.outputs.PUBSPEC_NAME }}
  PUBSPEC_PUBLISH_TO:
    description: The value set in the publish_to field of the pubspec.yaml file.
    value: ${{ steps.scan-pubspec.outputs.PUBSPEC_PUBLISH_TO }}
  PUBSPEC_REPOSITORY:
    description: The repository or homepage value from the pubspec.yaml file.
    value: ${{ steps.scan-pubspec.outputs.PUBSPEC_REPOSITORY }}
  PUBSPEC_VERSION:
    description: The full version from the pubspec.yaml file.
    value: ${{ steps.scan-pubspec.outputs.PUBSPEC_VERSION }}
  PUBSPEC_VERSION_MAJOR:
    description: The major value from the pubspec version.
    value: ${{ steps.scan-pubspec.outputs.PUBSPEC_VERSION_MAJOR }}
  PUBSPEC_VERSION_MINOR:
    description: The minor value from the pubspec version.
    value: ${{ steps.scan-pubspec.outputs.PUBSPEC_VERSION_MINOR }}
  PUBSPEC_VERSION_PATCH:
    description: The patch value from the pubspec version.
    value: ${{ steps.scan-pubspec.outputs.PUBSPEC_VERSION_PATCH }}
  PUBSPEC_VERSION_PRE_RELEASE:
    description: The prelease value from the pubspec version, if any.
    value: ${{ steps.scan-pubspec.outputs.PUBSPEC_VERSION_PRE_RELEASE }}

runs:
  using: 'composite'
  steps:
    - name: Scan pubspec.yaml
      id: scan-pubspec
      shell: bash
      run: |
        dart pub global activate -spath ./.github/mcore_gh_actions/packages/emit_pubspec_info
        emit_pubspec_info \
          --pubspec ${{ inputs.path }}/pubspec.yaml \

    - name: Echo outputs
      shell: bash
      run: |
        echo "PUBSPEC_DESCRIPTION=${{ steps.scan-pubspec.outputs.PUBSPEC_DESCRIPTION }}"
        echo "PUBSPEC_FLUTTER_SDK=${{ steps.scan-pubspec.outputs.PUBSPEC_FLUTTER_SDK }}"
        echo "PUBSPEC_NAME=${{ steps.scan-pubspec.outputs.PUBSPEC_NAME }}"
        echo "PUBSPEC_PUBLISH_TO=${{ steps.scan-pubspec.outputs.PUBSPEC_PUBLISH_TO }}"
        echo "PUBSPEC_REPOSITORY=${{ steps.scan-pubspec.outputs.PUBSPEC_REPOSITORY }}"
        echo "PUBSPEC_VERSION=${{ steps.scan-pubspec.outputs.PUBSPEC_VERSION }}"
        echo "PUBSPEC_VERSION_MAJOR=${{ steps.scan-pubspec.outputs.PUBSPEC_VERSION_MAJOR }}"
        echo "PUBSPEC_VERSION_MINOR=${{ steps.scan-pubspec.outputs.PUBSPEC_VERSION_MINOR }}"
        echo "PUBSPEC_VERSION_PATCH=${{ steps.scan-pubspec.outputs.PUBSPEC_VERSION_PATCH }}"
        echo "PUBSPEC_VERSION_PRE_RELEASE=${{ steps.scan-pubspec.outputs.PUBSPEC_VERSION_PRE_RELEASE }}"

```


<!-- /file -->
</details>

---

### setup_jfrog

#### Description

<!-- action_description: .github/actions/setup_jfrog/action.yaml -->
Authenticate with JFrog and emits the token using the output `JFROG_TOKEN`. For systems like Maven and Gradle that also require a username, this action will emit the token as the username using the output `JFROG_USER`.

When using this action, be sure to add the appropriate permissions to your workflow:

```yaml permissions:   actions: read   contents: write   id-token: write   packages: write   pull-requests: write   security-events: write  ``` 
<!-- /action_description -->

#### Inputs

<!-- action_inputs: .github/actions/setup_jfrog/action.yaml -->
Name | Required | Default | Description
--- | --- | --- | ---
`oidc-provider-name` | No | `mgmri-enterprise-oidc` | OIDC provider name.
`pub-url` | No | `https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub` | URL to the Dart package repository
`token` | **Yes** | _<n/a>_ | The GitHub token to use for authentication.
<!-- /action_inputs -->

#### Outputs

<!-- action_outputs: .github/actions/setup_jfrog/action.yaml -->
Name | Description
--- | ---
`JFROG_TOKEN` | JFrog authentication token
`JFROG_USER` | JFrog authentication user
<!-- /action_outputs -->

#### YAML

<details>
<summary>action.yaml</summary>

<!-- file: .github/actions/setup_jfrog/action.yaml -->

```yaml
name: Setup JFrog
description: |
  Authenticate with JFrog and emits the token using the output `JFROG_TOKEN`.
  For systems like Maven and Gradle that also require a username, this action
  will emit the token as the username using the output `JFROG_USER`.

  When using this action, be sure to add the appropriate permissions to your
  workflow:

  ```yaml
  permissions:
    actions: read
    contents: write
    id-token: write
    packages: write
    pull-requests: write
    security-events: write 
  ```

inputs:
  oidc-provider-name:
    default: 'mgmri-enterprise-oidc'
    description: OIDC provider name.
    required: false
  pub-url:
    default: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    description: URL to the Dart package repository
    required: false
  token:
    description: The GitHub token to use for authentication.
    required: true

outputs:
  JFROG_TOKEN:
    description: JFrog authentication token
    value: ${{ steps.setup-cli.outputs.oidc-token }}
  JFROG_USER:
    description: JFrog authentication user
    value: ${{ steps.setup-cli.outputs.oidc-user }}

runs:
  using: 'composite'
  steps:
    - name: Parse Repo URL
      shell: bash
      run: |
        echo "JFROG_BASE_URL=https://`echo ${{ inputs.pub-url }} | awk -F/ '{print $3}'`" >> $GITHUB_ENV

    - name: Setup JFrog CLI
      id: setup-cli
      uses: jfrog/setup-jfrog-cli@v4
      env:
        JF_GIT_TOKEN: ${{ inputs.token }}
        JF_URL: ${{ env.JFROG_BASE_URL }}
        JFROG_CLI_EXTRACTORS_REMOTE: ${{ inputs.pub-url }}
        JFROG_CLI_RELEASES_REPO: ${{ inputs.pub-url }}
      with:
        oidc-provider-name: ${{ inputs.oidc-provider-name }}
        disable-job-summary: false

    - name: Set the JFrog Token
      shell: bash
      run: echo JFROG_TOKEN=${{ steps.setup-cli.outputs.oidc-token }} >> $GITHUB_ENV

```


<!-- /file -->
</details>

