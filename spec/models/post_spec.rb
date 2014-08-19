require 'rails_helper'

RSpec.describe Post, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe '#tags_list' do
    let(:post) {Post.create(title: 'Lego Rules')}
      context 'no tags provided' do
        it 'gives 0 tags to post' do
          post.tags_list = ''
          expect(post.tags).to be_empty
        end
      end

      context '1 tag entered' do
        it 'adds 1 tag to our post' do
          post.tags_list = '#yolo'
          expect(post.tags.first.text).to eq '#yolo'
        end
      end

      context 'multiple tags' do
        it 'adds all the tags to our post' do
          post.tags_list = '#lego, #is, #fun'
          expect(post.tags.count).to eq 3
        end
      end

      context 'with existing tags' do
            before { Tag.create(text: '#yolo') }
        it 'should reuse tags' do
          post.tags_list = '#yolo, #emmet'
          expect(Tag.count).to eq 2
        end
      end

      context 'with duplicate tags' do
        it 'de-duplicates them' do
          post.tags_list = '#yolo, #emmet, #emmet'
          expect(post.tags.count).to eq 2
        end
      end
  end
end
