module RuGGby
  # Module used to convert messages from GG format (INT, Chars) to a ruby symbols
  module Converter
    # Available actions
    ACTION = {
      Packet::Incoming::Message::TYPE => :new_message,
      Packet::Incoming::Status::TYPE => :status_changed
    }

    # Available statuses (sent by GG server)
    STATUS = {
      0x02 => :available,
      0x04 => :available,
      0x03 => :busy,
      0x05 => :busy,
      0x14 => :invisible,
      0x16 => :invisible,
      0x01 => :not_available,
      0x15 => :not_available
    }

    # Statuses that we can use
    TO_STATUS = {
      available:     0x02,
      busy:          0x03,
      invisible:     0x14,
      not_available: 0x01
    }

    FROM_STATUS = {
      0x02 => :available,
      0x03 => :busy,
      0x01 => :not_available
    }

    # Statuses that are available but we also need to provide a description
    TO_STATUS_DESCRIPTION = {
      available:     0x04,
      busy:          0x05,
      invisible:     0x16,
      not_available: 0x15
    }

    def self.status(status)
      if status.is_a?(Symbol) || status.is_a?(String)
        TO_STATUS[status.to_sym]
      else
        STATUS[status]
      end
    end

    def self.status_description(status)
      TO_STATUS_DESCRIPTION[status]
    end

    def self.action(action)
      ACTION[action]
    end
  end
end
