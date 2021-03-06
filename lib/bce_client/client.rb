module BceClient
  # Entry-point classs
  class Client
    def initialize(options = {})
      rpc_user = options[:username] || 'user'
      rpc_pass = options[:password] || 'pass'
      rpc_host = options[:host] || '127.0.0.1'
      rpc_port = options[:port] || '8080'
      service_url = "http://#{rpc_user}:#{rpc_pass}@#{rpc_host}:#{rpc_port}"
      @rpc = BceClient::RPC.new service_url
    end

    def block(block_hash = nil)
      Block.new block_hash, @rpc
    end

    def network_info
      @rpc.getinfo || {}
    end

    def network_peer_info
      @rpc.getpeerinfo || []
    end
  end
end
