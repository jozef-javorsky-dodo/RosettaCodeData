Cmp ← {
  ⟨⟩ 𝕊 ⟨⟩: 0; · 𝕊 ⟨⟩: 1; ⟨⟩ 𝕊 ·: 2;
  𝕨 𝕊○(1⊸↓) 𝕩
}

cr←@+10

•Out {𝕊:
  (•Getline@){
    @ Longest 𝕩: 𝕩.str;
    𝕨 Longest 𝕩:
    (•Getline@) Longest 𝕨 {𝕨Cmp𝕩.curr}◶⟨
      {curr⇐𝕨,str⇐𝕩.str∾cr∾𝕨}
      {curr⇐𝕨,str⇐𝕨}
      ⊢
    ⟩ 𝕩
  }𝕩
}{curr⇐"",str⇐""}
