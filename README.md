# branch_links

The app can work with two different flavor: `dev` or `prod`.

## How launch the app in prod mode

To launch the app in prod mode you need to add `--dart-define=FLAVOR=prod` as run arguments.

`flutter run -d <DEVICE_ID> --dart-define=FLAVOR=prod`

## How launch the app in dev mode

To launch the app in dev mode you can add `--dart-define=FLAVOR=dev` as run arguments or leave the run
command to default.

`flutter run -d <DEVICE_ID> --dart-define=FLAVOR=dev`

`flutter run -d <DEVICE_ID>`

In dev mode you be able to select the environment from the home app bar dropdown.