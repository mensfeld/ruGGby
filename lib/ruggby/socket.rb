require 'socket'
require 'open-uri'

module RuGGby

  # TCP socket proxy
  class Socket
    # GG version that we send to the URL
    VERSION = '10.0.0.7669'
    # URL with 'real' server address
    URL = 'http://appmsg.gadu-gadu.pl'

    class NotOperating < Exception;
    end

    attr_reader :host, :port

    # We need to provide a GG number because different GG numbers might get
    # different 'real' servers
    def initialize(gg_nr)
      conn_params = self.class.connection_params(gg_nr)
      @host = conn_params[:host]
      @port = conn_params[:port]
      ensure_operating

      socket
    end

    # Before writing to socket, pack the incoming data
    # We use pack because we assume that only objects from
    # ruGGby::Packet::Outgoing might be send and all of them implemenent this
    # method
    def write(data)
      socket.write(data.pack)
    end

    private

    # Send all the unknown methods invokations into TCPSocket
    def method_missing(name, *args, &block)
      socket.public_send(name, *args, &block)
    end

    # Create a TCPSocket
    def socket
      @socket ||= ::TCPSocket.new(@host, @port)
    end

    # Get connection params
    def self.connection_params(gg_nr)
      gg_info = open(build_url(gg_nr)).readlines[0].split(/\s/)[2].split(':')
      {:host => gg_info[0], :port => gg_info[1]}
    end

    # Build the whole GG address
    # It is needed to obtain the "real" server IP address
    def self.build_url(gg_nr)
      @build_url ||= "#{URL}/appsvc/appmsg_ver8.asp?fmnumber=#{gg_nr}&version=#{VERSION}&lastmsg=0"
    end

    #  Raise exception if we will get a not operating 'real' server
    def ensure_operating
      raise NotOperating if @host == 'notoperating'
    end

  end

end
