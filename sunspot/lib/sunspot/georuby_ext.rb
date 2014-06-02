%w[ point circle polygon ].each do |fn|
  require 'geo_ruby/simple_features/' << fn
end

module GeoRuby
  module SimpleFeatures
    class Point < Geometry
      def to_indexed
        "#{lat.to_f},#{lng.to_f}"
      end
    end

    class Circle < Geometry
      def to_indexed
        "#{center.lat.to_f},#{center.lng.to_f} d=#{radius.to_f}"
      end
    end

    class Polygon < Geometry
      alias_method :to_indexed, :as_wkt
    end
  end
end
