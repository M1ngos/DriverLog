class Avo::Resources::Task < Avo::BaseResource
  self.title = :title
  self.includes = [ :driver, :client ]
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :idlo
    field :title, as: :text
    field :description, as: :textarea
    # field :driver_id, as: :number
    field :driver, as: :belongs_to
    field :client, as: :belongs_to
    field :created_at, as: :date_time
    field :updated_at, as: :date_time
  end
end
