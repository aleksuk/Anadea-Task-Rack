require_relative 'dependency'

use Rack::Reloader

use Exeption
use Content
use Session

run Shop.new