FactoryBot.define do
  factory :power do
    money_redeem { false }
    product_redeem { false }
    navbox_scan { false }
    clients_profile { false }
    branch_analytics { false }
    create_campaign { false }
    branch_storage { false }
    home_delivery { false }
    organization { nil }
    employee_user { '' }
  end
end
