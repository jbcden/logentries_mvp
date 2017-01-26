class TaggedLogger
  def self.log(tag:, values: {}, level: 'info', logger: Rails.logger)
    logger.tagged(tag) do
      logger.public_send(level) do
        params = values.map do |k, v|
          encoded = v.to_s.encode('ISO8859-1',
                                  'UTF-8',
                                  invalid: :replace,
                                  undef: :replace)
          %(#{k}="#{encoded}")
        end
        params.join(' ')
      end
    end
  end
end

