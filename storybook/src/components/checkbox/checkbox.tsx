import { Component, Prop, h, Listen, State, Watch } from '@stencil/core';

@Component({
  tag: 'zenit-checkbox',
  styleUrl: 'checkbox.scss',
  shadow: true,
})
export class Checkbox {

  @State() isFocused = false;
  @Listen('focus')
  _focusHandler(e: FocusEvent) {
    if (!e.defaultPrevented) {
      this.isFocused = true;
    }
  }
  @Listen('blur')
  _blurHandler(e: FocusEvent) {
    if (!e.defaultPrevented) {
      this.isFocused = false;
    }
  }

  /**
   * Whether the box is checked. If it has an indeterminate value,
   * then use "mixed".
   */
  @Prop({ mutable: true }) value: "on" | "off" | "mixed";

  /**
   * Whether to allow "click" actions to switch to the
   * intermediate/mixed state.
   */
  @Prop() tristate: boolean;

  /**
   * Whether the button should not be clickable.
   */
  @Prop() disabled: boolean;

  fromState: "on" | "off" | "mixed" | null = null;

  _trigger() {
    this.fromState = this.value ?? "off";

    if (this.value == "mixed") {
      this.value = "on";
    } else if (this.tristate && (this.value == "off" || this.value == null)) {
      this.value = "mixed";
    } else {
      this.value = ((this.checked) == false ? "on" : "off");
    }
  }

  @Listen('click')
  onClickHandler(event: MouseEvent) {
    if (!event.defaultPrevented && !this.disabled) {
      this._trigger();
    }
  }
  @Listen('keydown')
  onKeydownHandler(event: KeyboardEvent) {
    if ((event.key == "Enter" || event.key == " ") && event.repeat == false && !event.defaultPrevented && !this.disabled) {
      this._trigger();
    }
  }

  get checked() {
    return this.value == "on" ? true : false;
  }
  get ariaChecked() {
    return this.value == "mixed" ? "mixed" : this.value == "on" ? "true" : "false";
  }
  fromStateString() {
    return this.fromState === "mixed" ? "mixed" : this.fromState == null ? "" : this.fromState == "on" ? "on" : "off";
  }

  @Watch('isFocused')
  render() {
    return <svg data-checked={this.value ?? 'off'} data-disabled={this.disabled} data-from-state={this.fromStateString()} width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" role="checkbox" aria-checked={this.ariaChecked} aria-disabled={this.disabled} tabindex={this.isFocused ? -1 : 0}>
      <rect class="--bg" width="24" height="24" rx="6" fill="#0475F7" />
      <path class="--mark" d="M 6 12 L 10 16 L 18 8" stroke="#FAFAFA" stroke-linecap="round" stroke-linejoin="round" stroke-width={2} />
      <path class="--mixed" d="M 6 12 L 10 12 L 18 12" stroke="#FAFAFA" stroke-linecap="round" stroke-width={0} />
    </svg>;
  }
}