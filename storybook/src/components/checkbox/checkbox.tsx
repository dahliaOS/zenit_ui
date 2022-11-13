import { Component, Prop, h, Listen } from '@stencil/core';

@Component({
  tag: 'zenit-checkbox',
  styleUrl: 'checkbox.scss',
  shadow: true,
})
export class Checkbox {

  /**
   * Whether the box is checked. If it has an indeterminate value,
   * then use "mixed".
   */
  @Prop() value: "on" | "off" | "mixed";

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

  @Listen('click')
  onClickHandler(event: MouseEvent) {
    if (!event.defaultPrevented && !this.disabled) {
      console.log("click!");
      this.fromState = this.value ?? "off";

      if (this.value == "mixed") {
        this.value = "on";
      } else if (this.tristate && (this.value == "off" || this.value == null)) {
        this.value = "mixed";
      } else {
        this.value = ((this.checked) == false ? "on" : "off");
      }
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

  render() {
    return <svg data-checked={this.value ?? 'off'} data-disabled={this.disabled} data-from-state={this.fromStateString()} width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" role="checkbox" aria-checked={this.ariaChecked} aria-disabled={this.disabled} tabindex={0}>
      <rect class="--bg" width="24" height="24" rx="6" fill="#0475F7" />
      <path class="--mark" d="M 6 12 L 10 16 L 18 8" stroke="#FAFAFA" stroke-linecap="round" stroke-linejoin="round" stroke-width={2} />
      <path class="--mixed" d="M 6 12 L 10 12 L 18 12" stroke="#FAFAFA" stroke-linecap="round" stroke-width={0} />
    </svg>;
  }
}