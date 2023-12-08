
python gpt_gleam/labeled.py \
  --config configs/cfact/cfact-gpt4.yaml \
  --data_path /shared/hltdir4/disk1/team/data/corpora/co-vax-frames/covid19/co-vax-frames-train.jsonl \
  --frame_path /shared/hltdir4/disk1/team/data/corpora/co-vax-frames/covid19/frames.json \
  --output_path /shared/aifiles/disk1/media/artifacts/cfact/co-vax-frames/cfact-gpt4.jsonl

python gpt_gleam/unlabeled.py \
  --config configs/cfact/cfact-gpt4.yaml \
  --data_path /shared/hltdir4/disk1/team/data/corpora/co-vax-frames/covid19/co-vax-frames-test.jsonl \
  --frame_path /shared/hltdir4/disk1/team/data/corpora/co-vax-frames/covid19/frames.json \
  --output_path /shared/aifiles/disk1/media/artifacts/cfact/co-vax-frames/cfact-gpt4-test.jsonl

python gpt_gleam/unlabeled.py \
  --config configs/cfact/cfact-gpt4v.yaml \
  --data_path /shared/aifiles/disk1/media/twitter/v10/data/test.jsonl \
  --frame_path /shared/hltdir4/disk1/team/data/corpora/co-vax-frames/covid19/frames.json \
  --output_path /shared/aifiles/disk1/media/artifacts/cfact/co-vax-frames/cfact-gpt4v.jsonl

# Need to run
python gpt_gleam/verify.py \
  --config configs/cfact/verify-gpt4.yaml \
  --frame_path /shared/hltdir4/disk1/team/data/corpora/co-vax-frames/covid19/frames.json \
  --data_path /shared/hltdir4/disk1/team/data/corpora/co-vax-frames/covid19/co-vax-frames-test.jsonl \
  --cfact_path /shared/aifiles/disk1/media/artifacts/cfact/co-vax-frames/cfact-gpt4-test.jsonl \
  --output_path /shared/aifiles/disk1/media/artifacts/cfact/co-vax-frames/verify-gpt4-test.jsonl

python gpt_gleam/verify.py \
    --config configs/cfact/verify-gpt4v.yaml \
    --frame_path /shared/hltdir4/disk1/team/data/corpora/co-vax-frames/covid19/frames.json \
    --data_path /shared/aifiles/disk1/media/twitter/v10/data/test.jsonl \
    --cfact_path /shared/aifiles/disk1/media/artifacts/cfact/co-vax-frames/cfact-gpt4v.jsonl \
    --output_path /shared/aifiles/disk1/media/artifacts/cfact/co-vax-frames/verify-gpt4v-test.jsonl

python gpt_gleam/eval.py \
    --data_path /shared/hltdir4/disk1/team/data/corpora/co-vax-frames/covid19/co-vax-frames-test.jsonl \
    --frame_path /shared/hltdir4/disk1/team/data/corpora/co-vax-frames/covid19/frames.json \
    --pred_path /shared/aifiles/disk1/media/artifacts/cfact/co-vax-frames/verify-gpt4-test.jsonl \
    --output_path /shared/aifiles/disk1/media/artifacts/cfact/co-vax-frames/results-gpt4-test.txt

python gpt_gleam/eval.py \
    --data_path /shared/aifiles/disk1/media/twitter/v10/data/test.jsonl \
    --frame_path /shared/hltdir4/disk1/team/data/corpora/co-vax-frames/covid19/frames.json \
    --pred_path /shared/aifiles/disk1/media/artifacts/cfact/co-vax-frames/verify-gpt4v-test.jsonl \
    --output_path /shared/aifiles/disk1/media/artifacts/cfact/co-vax-frames/results-gpt4v-test.txt


python gpt_gleam/labeled.py \
  --config configs/cfact/direct-gpt4v.yaml \
  --data_path /shared/aifiles/disk1/media/twitter/v10/data/test.jsonl \
  --frame_path /shared/hltdir4/disk1/team/data/corpora/co-vax-frames/covid19/frames.json \
  --output_path /shared/aifiles/disk1/media/artifacts/cfact/co-vax-frames/direct-gpt4v.jsonl

python gpt_gleam/labeled.py \
  --config configs/cfact/cot-gpt4v.yaml \
  --data_path /shared/aifiles/disk1/media/twitter/v10/data/test.jsonl \
  --frame_path /shared/hltdir4/disk1/team/data/corpora/co-vax-frames/covid19/frames.json \
  --output_path /shared/aifiles/disk1/media/artifacts/cfact/co-vax-frames/cot-gpt4v.jsonl
