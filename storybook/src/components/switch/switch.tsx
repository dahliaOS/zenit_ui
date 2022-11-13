import { Component, Prop, h, Listen, State, Watch } from '@stencil/core';

@Component({
  tag: 'zenit-switch',
  styleUrl: 'switch.scss',
  shadow: true,
})
export class Switch {

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
   * Whether the switch is on (true) or off (false).
   */
  @Prop() checked: boolean;

  /**
   * Whether the button should not be clickable.
   */
  @Prop() disabled: boolean;

  // @Event({
  //   eventName: 'click',
  //   composed: true,
  //   cancelable: true,
  //   bubbles: true,
  // }) click: EventEmitter<MouseEvent>;

  _trigger() {
    this.checked = !this.checked;
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

  @Watch('isFocused')
  render() {
    return <svg onKeyDown={this.onKeydownHandler} data-checked={this.checked} data-disabled={this.disabled} width="48" height="24" viewBox="0 0 48 24" fill="none" xmlns="http://www.w3.org/2000/svg" role="switch" aria-checked={this.checked ? "true" : "false"} aria-disabled={this.disabled} tabindex={this.isFocused ? -1 : 0}>
      <rect class="--bg" width="48" height="24" rx="12" fill="#00B26E" />
      <rect class="--thumb" width="16" height="16" x="4" y="4" rx="8" fill="#FAFAFA" />
    </svg>;
  }
}
