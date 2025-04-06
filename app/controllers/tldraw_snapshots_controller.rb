class TldrawSnapshotsController < ApplicationController
  def index
    @tldraw_snapshots = TldrawSnapshot.all
  end

  def show
    @tldraw_snapshot = TldrawSnapshot.find(params[:id])
  end

  def new
    @tldraw_snapshot = TldrawSnapshot.new
  end

  def edit
    @tldraw_snapshot = TldrawSnapshot.find(params[:id])
  end

  def create
    @tldraw_snapshot = TldrawSnapshot.new(tldraw_snapshot_params)
    if @tldraw_snapshot.save
      redirect_to @tldraw_snapshot
    else
      render "new"
    end
  end

  def update
    @tldraw_snapshot = TldrawSnapshot.find(params[:id])
    if @tldraw_snapshot.update(tldraw_snapshot_params)
      redirect_to @tldraw_snapshot
    else
      render "edit"
    end
  end

  def destroy
    @tldraw_snapshot = TldrawSnapshot.find(params[:id])
    @tldraw_snapshot.destroy
    redirect_to tldraw_snapshots_path
  end

  private

  def tldraw_snapshot_params
    params.require(:tldraw_snapshot).permit(:title, :description)
  end
end
