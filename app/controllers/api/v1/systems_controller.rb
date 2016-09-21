module Api
  module V1

    class SystemsController < VersionController
      before_action :set_system, only: [:show, :update, :destroy]
    
      # GET /systems
      def index
        @systems = System.all
    
        render json: @systems
      end
    
      # GET /systems/1
      def show
        render json: @system
      end
    
      def create
      # POST /systems
        @system = System.find_by(name: params[:system][:name])
        
        if @system
          if compare_params
            render json: @system, status: 200, location: @system
          else
            if @system.update(system_params)
              render json: @system
            else
              render json: @system.errors, status: :unprocessable_entity
            end         
          end
        else
          @system = System.new(system_params)
    
          if @system.save
            render json: @system, status: :created, location: @system
          else
            render json: @system.errors, status: :unprocessable_entity
          end
        end
      end
  
      # PATCH/PUT /systems/1
      def update
        if @system.update(system_params)
          render json: @system
        else
          render json: @system.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /systems/1
      def destroy
        @system.destroy
      end
    
      private
        def compare_params
          [params["name"], 
           params["resource_group"]].uniq == 
          [@system.name, 
           @system.resource_group]
        end
        
        # Use callbacks to share common setup or constraints between actions.
        def set_system
          @system = System.find(params[:id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def system_params
          params.require(:system).permit(:name, :resource_group, :availability_set, :operating_system, :vm_size, :operating_system_version, :storage, :subnet, :ip, :nsg, :nsg_resource_group)
        end
    end
  end
end
