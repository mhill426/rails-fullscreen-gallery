class Slide < ActiveRecord::Base

	mount_uploader :image, ImageUploader

	scope :next, lambda {|id| where("id > ?",id).order("id ASC") } # this is the default ordering for AR
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }
  scope :lastly, lambda {|id| where("id > ?",id).order("id DESC") }

  def next
    Slide.next(self.id).first
  end

  def previous
    Slide.previous(self.id).first
  end

  def first
    Slide.find(1)
  end

  def last
    Slide.lastly(self.id).first
  end
end
