module RuGGby

  module Packet

    # Will build a certain incoming packet based on a message header
    class Factory

      # I => unsigned int, native endian
      HEADER_PACK_PATTERN = 'II'
      HEADER_SIZE = 8

      attr_reader :type, :length, :data

      def initialize(socket)
        unpacked = socket.read(HEADER_SIZE).unpack HEADER_PACK_PATTERN
        @type, @length = unpacked
        @data = socket.read(@length)
      end

      def build
        case @type
          when Packet::Incoming::Welcome::TYPE then
            Incoming::Welcome.new(@data)
          when Packet::Incoming::LoginStatus::TYPE then
            Packet::Incoming::LoginStatus.new(true)
          when Packet::Incoming::Message::TYPE then
            Packet::Incoming::Message.new(@data)
          when Packet::Incoming::Status::TYPE then
            Packet::Incoming::Status.new(@data)
          when Packet::Incoming::Status::TYPE_2 then
            Packet::Incoming::Status.new(@data)
          when nil
            Packet::Incoming::LoginStatus.new(false)
          else
            nil
        end
      end

    end

  end

end