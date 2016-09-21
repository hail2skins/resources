module Api
  module V1

    class SystemsController < VersionController
      before_action :set_system, only: [:show, :update, :destroy]
    
      # GET /systems
      def index
        @systems = System.all
      end
    
      # GET /systems/1
      def show
      end
    
      def create
      # POST /systems
        @system = System.find_by(name: params[:system][:name])
        
        respond_to do |format|
          if @system
            if compare_params
              format.json { render :show, status: :created, location: @system }
            else
              if @system.update(system_params)
                format.json { render :show, status: :ok, location: @system }
              else
                format.json { render json: @system.errors, status: :unprocessable_entity }
              end         
            end
          else
            @system = System.new(system_params)
      
            if @system.save
              format.json { render :show, status: :ok, location: @system }
            else
              format.json { render json: @system.errors, status: :unprocessable_entity }
            end
          end
        end
      end
  
      # PATCH/PUT /systems/1
      def update
        respond_to do |format|
          if @system.update(system_params)
            format.json { render :show, status: :ok, location: @system }
          else
            format.json { render json: @system.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /systems/1
      def destroy
        @system.destroy
        respond_to do |format|
          format.html { redirect_to systems_url, notice: 'System was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    
      private
        def compare_params
          [params["name"],
           params["resource_group"],
           params["availability_set"],
           params["operating_system"],
           params["vm_size"],
           params["operating_system_version"],
           params["storage"],
           params["subnet"],
           params["ip"],
           params["nsg"],
           params["nsg_resource_group"],
           params["location"]].uniq == 
          [@system.name,
           @system.resource_group,
           @system.availability_set,
           @system.operating_system,
           @system.vm_size,
           @system.storage,
           @system.subnet,
           @system.ip,
           @system.nsg,
           @system.nsg_resource_group,
           @system.location]
        end
        
        # Use callbacks to share common setup or constraints between actions.
        def set_system
          @system = System.find(params[:id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def system_params
          params.require(:system).permit(:name, 
                                        :resource_group, 
                                        :availability_set, 
                                        :operating_system, 
                                        :vm_size, 
                                        :operating_system_version, 
                                        :storage, 
                                        :subnet, 
                                        :ip, 
                                        :nsg, 
                                        :nsg_resource_group,
                                        :location)
        end
    end
  end
end
