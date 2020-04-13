FactoryBot.define do

  factory :item do
    name            {"スカート"}
    description     {"ミニです"}
    category_id     {"1"}
    condition       {"新品"}
    postage_payer   {"送料込み"}
    shipping_from   {"東京都"}
    necessary_days  {"１〜２日で発送"}
    price           {"100"}
  end

end