class InvitesController < InheritedResources::Base

  private

    def invite_params
      params.require(:invite).permit(:email, :name)
    end
end

