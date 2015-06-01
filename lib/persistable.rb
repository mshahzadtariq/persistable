module Persistable
  extend ActiveSupport::Concern

  included do

    default_scope -> { where("deleted = ? OR deleted = ?", nil, false) }

    scope :with_deleted, -> { self.unscoped.where("deleted = ? OR deleted = ? OR deleted = ?", nil, false, true) }
    scope :only_deleted, -> { self.unscoped.where(deleted: true) }

    def destroy
      self.set(:deleted => true)
    end

    def recover
      self.set(:deleted => false)
    end

  end

end
