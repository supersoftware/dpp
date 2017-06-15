set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd $DIR/lb-stack

terraform destroy -var-file ../terraform.tfvars

popd

pushd $DIR/core-stacks

terraform destroy -var-file ../terraform.tfvars

popd
