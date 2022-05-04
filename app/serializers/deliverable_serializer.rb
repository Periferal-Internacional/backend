class DeliverableSerializer

    def initialize(deliverable: nil)
      @deliverable = deliverable
    end
  
    def serialize_new_deliverable()
        serialized_new_deliverable = serialize_deliverable(@deliverable)
        serialized_new_deliverable.to_json()
    end
      
      private def serialize_deliverable(deliverable)
        {
          deliverable: {
            id: deliverable.id,
            user_id: deliverable.user_id,
            name: deliverable.name,
            deliverable_type: deliverable.deliverable_type,
            comment: deliverable.comment,
            grade: deliverable.grade,
            approved: deliverable.approved,
            file_url: deliverable.get_file_url(),
            created_at: deliverable.created_at,
            updated_at: deliverable.updated_at,
          }
        }
      end
      
      
    end