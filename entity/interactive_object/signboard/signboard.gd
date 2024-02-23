extends StaticBody2D

func _on_interactable_state_interacted():
	TextboxManager.main_textbox("看板にはなにも書かれていない。")
