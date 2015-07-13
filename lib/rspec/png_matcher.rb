require "rspec/png_matcher/version"
require 'rspec/expectations'
require 'chunky_png'
require 'forwardable'

module RSpec
  class PngImage
    extend Forwardable
    def_delegators :@image, :pixels, :width, :height

    def initialize(input)
      @image = case input
      when IO, StringIO
        ChunkyPNG::Image.from_io(input)
      when ChunkyPNG::Datastream
        ChunkyPNG::Image.from_ds(input)
      else
        ChunkyPNG::Image.from_file(input.to_s)
      end
    end

    def ==(other)
      other.kind_of?(self.class) && other.pixels == self.pixels &&
        other.width == self.width && other.height == self.height
    end
  end
end

RSpec::Matchers.define :eq_as_png do |expected|
  match do |actual|
    RSpec::PngImage.new(expected) == RSpec::PngImage.new(actual)
  end
end
