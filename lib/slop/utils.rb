class Slop
  module Utils

    private

    def exec_constructor_block(&block)
      case block.arity.abs
      when 0
        if @config[:switch_constructor_context]
          instance_exec(&block)
        else
          block.call
        end
      when 1
        if @config[:switch_constructor_context]
          instance_exec self, &block
        else
          block.call self
        end
      else
       raise ArgumentError,
         "wrong number of block arguments (#{block.arity} for #{0..1})"
      end
    end

  end
end
