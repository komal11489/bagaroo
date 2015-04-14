class BugsController < ApplicationController
  before_action :set_bug, only: [:show, :edit, :update, :destroy]
  before_action :all_bugs, only: [:index, :create, :destroy, :update]
  before_action :set_statuses
  before_action :set_priorities
  before_action :set_issue_types
  respond_to :html, :js


  def all_bugs
    @bugs = Bug.all
  end
  # GET /bugs
  # GET /bugs.json
  def index
    @bugs = Bug.all
  end

  # GET /bugs/1
  # GET /bugs/1.json
  def show
  end

  # GET /bugs/new
  def new
    @bug = Bug.new
  end

  # GET /bugs/1/edit
  def edit
  end

  # POST /bugs
  # POST /bugs.json
  def create
    @bug = Bug.new(bug_params)
    user = User.find(bug_params[:user_id])
    @bug.build_user(:id => user.id)
      
    @bug.save!
    @current_bug = @bug
    @bugs = Bug.all

  end

  

  # PATCH/PUT /bugs/1
  # PATCH/PUT /bugs/1.json
  def update
    @bug.update!(bug_params)
  end

  # DELETE /bugs/1
  # DELETE /bugs/1.json
  def destroy
    @bug.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      @bug = Bug.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bug_params
      params.require(:bug).permit(:title, :description, :issue_type, :priority, :status, :user_id)
    end

    def set_statuses
      @statuses = Bug.statuses
    end

    def set_issue_types
      @issue_types = Bug.issue_types
    end

    def set_priorities
      @priorities = Bug.priorities
    end
end
