module Fusioncharts
  class Chart
    include ::ActionView::Helpers::OutputSafetyHelper

    attr_accessor :options, :fusionchartsEvent
    attr_reader :width, :height, :type, :renderAt, :dataSource, :dataFormat, :jsonUrl, :xmlUrl

    # Constructor
    def initialize(options = nil)
      @fusionchartsEvent = ''
      if options.nil?
        @options = {}
      else
        @options = options
        parse_options
      end
    end

    # Sets the width for a chart
    def width=(width)
      @width = width.to_s

      setOption('width', @width)
    end

    # Sets the height for a chart
    def height=(height)
      @height = height.to_s

      setOption('height', @height)
    end

    # Set the type for a chart
    def type=(type)
      @type = type

      setOption('type', @type)
    end

    # Sets the dataformat for a chart.
    # Valid values are: json / xml
    def dataFormat=(format)
      @dataFormat = format

      setOption('dataFormat', @dataFormat)
    end

    # Set the DOM id where the chart needs to be rendered
    def renderAt=(id)
      @renderAt = id

      setOption('renderAt', @renderAt)
    end

    # Set the datasource for the chart. It can take the following formats
    # 1. Ruby Hash
    # 2. XML string
    # 3. JSON string
    def dataSource=(dataSource)
      @dataSource = dataSource
      parse_datasource_json
    end

    # Set the JSON url where data needs to be loaded
    attr_writer :jsonUrl

    # Set the XML url where data needs to be loaded
    attr_writer :xmlUrl

    # Returns where the chart needs to load XML data from a url
    def xmlUrl?
      xmlUrl ? true : false
    end

    # Returns where the chart needs to load JSON data from a url
    def jsonUrl?
      jsonUrl ? true : false
    end

    def addEvent(eventName, eventHandler)
      @fusionchartsEvent << "\n_fc_chart.addEventListener(\"" << eventName << '",' << eventHandler << ")\n"
    end

    # Render the chart
    def render
      config = json_escape JSON.generate(options)
      dataUrlFormat = jsonUrl? ? 'json' : (xmlUrl ? 'xml' : nil)
      template = File.read(File.expand_path('../../templates/chart.erb', __dir__))
      renderer = ERB.new(template)
      raw renderer.result(binding)
    end

    private

    # Helper method to add property to the options hash
    def setOption(key, value)
      options[key] = value

      self
    end

    # Helper method to convert json string to Ruby hash
    def parse_datasource_json
      @dataFormat = 'json' unless defined? @dataFormat

      if !xmlUrl? || !jsonUrl?
        @dataSource = JSON.parse(@dataSource) if @dataSource.is_a?(String) && (@dataFormat == 'json')
      end

      setOption('dataSource', @dataSource)
    end

    # Helper method that converts the constructor params into instance variables
    def parse_options
      keys = @options.keys
      keys.each { |k| instance_variable_set "@#{k}".to_sym, @options[k] if respond_to? k }
      # parse_datasource_json
    end

    # Escape tags in json, if avoided might be vulnerable to XSS
    def json_escape(str)
      str.to_s.gsub('/', '\/')
    end
  end
end
