require 'rails_helper'

RSpec.describe BatchOperation::PhoneCallQueueRemoteFetch do
  let(:factory) { :phone_call_queue_remote_fetch_batch_operation }

  include_examples("batch_operation")
  include_examples("phone_call_operation_batch_operation")
  include_examples("phone_call_event_operation_batch_operation") do
    let(:phone_call_factory_attributes) {
      {
        :status => PhoneCall::STATE_REMOTELY_QUEUED,
        :remote_call_id => SecureRandom.uuid
      }
    }
    let(:asserted_status_after_run) { PhoneCall::STATE_REMOTE_FETCH_QUEUED }
    let(:invalid_transition_status) { PhoneCall::STATE_CREATED }
  end
end
