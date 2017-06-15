set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd $DIR/core-stacks

terraform plan -var-file ../terraform.tfvars

popd
