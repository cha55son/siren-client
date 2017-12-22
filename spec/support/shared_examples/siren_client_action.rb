shared_examples 'a SirenClient::Action' do
  describe '.config' do
    it 'is a hash' do
      expect(action.config).to be_a Hash
    end

    it 'can access a property of the config' do
      expect(action.config[:headers]['Accept']).to eq('application/json')
    end
  end

  describe 'when initialized with data' do
    describe '.payload' do
      it 'is a hash' do
        expect(action.payload).to be_a Hash
      end

      it 'is NOT overwritten with SirenClient::Field classes' do
        expect(action.payload['fields'][0]).to be_a Hash
      end
    end

    describe '.name' do
      it 'is a string' do
        expect(action.name).to eq action_data['name']
      end
    end

    describe '.classes' do
      it 'is an array' do
        expect(action.classes).to match_array action_data['class']
      end
    end

    describe '.method' do
      it 'is a string' do
        expect(action.method).to eq 'get'
      end
    end

    describe '.href' do
      it 'is a string' do
        expect(action.href).to eq action_data['href']
      end

      it 'can change .href as needed' do
        action.href = action.href + '?query=test'
        expect(/query=test/).to match(action.href)
      end
    end

    describe '.title' do
      it 'is a string' do
        expect(action.title).to eq action_data['title']
      end
    end

    describe '.type' do
      it 'is a string' do
        expect(action.type).to eq action_data['type']
      end
    end

    describe '.fields' do
      it 'is an array' do
        expect(action.fields).to be_a Array
      end

      it 'is an array of SirenClient::Field\'s' do
        action.fields.each do |field|
          expect(field).to be_a SirenClient::Field
        end
      end
    end
  end

  describe '.where(params)' do
    it 'executes the GET action' do
      # I'm expecting an error here, all I want to see is that the url it being traversed.
      expect { action.where(test: 'hi') }.to raise_error SirenClient::InvalidResponseError
    end

    it 'GET action does not send the Content-Type header' do
      expect { action.where(test: 'hi') }.to raise_error SirenClient::InvalidResponseError
      expect(output_buffer.string).not_to include('Content-Type: application/x-www-form-urlencoded')
    end

    it 'executes the POST action' do
      # I'm expecting an error here, all I want to see is that the url it being traversed.
      expect { action_post.where(test: 'hi') }.to raise_error SirenClient::InvalidResponseError
    end

    it 'POST action does send the Content-Type header' do
      expect { action_post.where(test: 'hi') }.to raise_error SirenClient::InvalidResponseError
      expect(output_buffer.string).to include('Content-Type: application/x-www-form-urlencoded')
    end

    it 'executes the DELETE action' do
      expect { action_delete.submit }.to raise_error SirenClient::InvalidResponseError
    end
  end

  describe '.submit' do
    it 'executes the action without any parameters' do
      expect { action.submit }.to raise_error SirenClient::InvalidResponseError
    end
  end
end
