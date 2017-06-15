set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd $DIR/core-stacks

terraform apply -var-file ../terraform.tfvars

popd

pushd $DIR/lb-stack

terraform apply -var-file ../terraform.tfvars

popd